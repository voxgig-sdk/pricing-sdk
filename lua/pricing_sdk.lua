-- Pricing SDK

local vs = require("utility.struct.struct")
local Utility = require("core.utility_type")
local Spec = require("core.spec")
local helpers = require("core.helpers")

-- Load utility registration (populates Utility._registrar)
require("utility.register")

-- Load features
local BaseFeature = require("feature.base_feature")
local features_factory = require("features")


local PricingSDK = {}
PricingSDK.__index = PricingSDK


local function _make_feature(name)
  local factory = features_factory[name]
  if factory ~= nil then
    return factory()
  end
  return features_factory.base()
end

PricingSDK._make_feature = _make_feature


function PricingSDK.new(options)
  local self = setmetatable({}, PricingSDK)
  self.mode = "live"
  self.features = {}
  self.options = nil

  local utility = Utility.new()
  self._utility = utility

  local config = require("config")()

  self._rootctx = utility.make_context({
    client = self,
    utility = utility,
    config = config,
    options = options or {},
    shared = {},
  }, nil)

  self.options = utility.make_options(self._rootctx)

  if vs.getpath(self.options, "feature.test.active") == true then
    self.mode = "test"
  end

  self._rootctx.options = self.options

  -- Add features in the resolved order (make_options puts an explicit list
  -- order first, else defaults to test-first). Ordering matters: the `test`
  -- feature installs the base mock transport and the transport features
  -- (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  -- must be added before them to sit at the base of the chain.
  local feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
  if feature_opts ~= nil then
    local featureorder = vs.getpath(self.options, "__derived__.featureorder")
    if type(featureorder) == "table" then
      for _, fname in ipairs(featureorder) do
        local fopts = helpers.to_map(feature_opts[fname])
        if fopts ~= nil and fopts["active"] == true then
          utility.feature_add(self._rootctx, _make_feature(fname))
        end
      end
    end
  end

  -- Add extension features.
  local extend = vs.getprop(self.options, "extend")
  if type(extend) == "table" then
    for _, f in ipairs(extend) do
      if type(f) == "table" and type(f.get_name) == "function" then
        utility.feature_add(self._rootctx, f)
      end
    end
  end

  -- Initialize features.
  for _, f in ipairs(self.features) do
    utility.feature_init(self._rootctx, f)
  end

  utility.feature_hook(self._rootctx, "PostConstruct")

  -- #BuildFeatures

  return self
end


function PricingSDK:options_map()
  local out = vs.clone(self.options)
  if type(out) == "table" then
    return out
  end
  return {}
end


function PricingSDK:get_utility()
  return Utility.copy(self._utility)
end


function PricingSDK:get_root_ctx()
  return self._rootctx
end


function PricingSDK:prepare(fetchargs)
  local utility = self._utility

  fetchargs = fetchargs or {}

  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "prepare",
    ctrl = ctrl,
  }, self._rootctx)

  local options = self.options

  local path = vs.getprop(fetchargs, "path") or ""
  if type(path) ~= "string" then path = "" end

  local method = vs.getprop(fetchargs, "method") or "GET"
  if type(method) ~= "string" then method = "GET" end

  local params = helpers.to_map(vs.getprop(fetchargs, "params")) or {}
  local query = helpers.to_map(vs.getprop(fetchargs, "query")) or {}

  local headers = utility.prepare_headers(ctx)

  local base = vs.getprop(options, "base") or ""
  if type(base) ~= "string" then base = "" end
  local prefix = vs.getprop(options, "prefix") or ""
  if type(prefix) ~= "string" then prefix = "" end
  local suffix = vs.getprop(options, "suffix") or ""
  if type(suffix) ~= "string" then suffix = "" end

  ctx.spec = Spec.new({
    base = base,
    prefix = prefix,
    suffix = suffix,
    path = path,
    method = method,
    params = params,
    query = query,
    headers = headers,
    body = vs.getprop(fetchargs, "body"),
    step = "start",
  })

  -- Merge user-provided headers.
  local uh = vs.getprop(fetchargs, "headers")
  if type(uh) == "table" then
    for k, v in pairs(uh) do
      ctx.spec.headers[k] = v
    end
  end

  local _, err = utility.prepare_auth(ctx)
  if err ~= nil then
    return nil, err
  end

  return utility.make_fetch_def(ctx)
end


function PricingSDK:direct(fetchargs)
  local utility = self._utility

  local fetchdef, err = self:prepare(fetchargs)
  if err ~= nil then
    return { ok = false, err = err }, nil
  end

  fetchargs = fetchargs or {}
  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "direct",
    ctrl = ctrl,
  }, self._rootctx)

  local url = fetchdef["url"] or ""
  local fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

  if fetch_err ~= nil then
    return { ok = false, err = fetch_err }, nil
  end

  if fetched == nil then
    return {
      ok = false,
      err = ctx:make_error("direct_no_response", "response: undefined"),
    }, nil
  end

  if type(fetched) == "table" then
    local status = helpers.to_int(vs.getprop(fetched, "status"))
    local headers = vs.getprop(fetched, "headers") or {}

    -- No-body responses (204, 304) and explicit zero content-length
    -- must skip JSON parsing — calling json() on an empty body errors.
    local content_length = nil
    if type(headers) == "table" then
      content_length = headers["content-length"]
    end
    local no_body = status == 204 or status == 304 or tostring(content_length) == "0"

    local json_data = nil
    if not no_body then
      local jf = vs.getprop(fetched, "json")
      if type(jf) == "function" then
        local ok, result = pcall(jf)
        if ok then
          json_data = result
        end
        -- Non-JSON body: json_data stays nil, status/headers preserved.
      end
    end

    return {
      ok = status >= 200 and status < 300,
      status = status,
      headers = headers,
      data = json_data,
    }, nil
  end

  return {
    ok = false,
    err = ctx:make_error("direct_invalid", "invalid response type"),
  }, nil
end



-- Idiomatic facade: client:Compare():list() / client:Compare():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Compare(data)
  local EntityMod = require("entity.compare_entity")
  if data == nil then
    if self._compare == nil then
      self._compare = EntityMod.new(self, nil)
    end
    return self._compare
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:CostGuide():list() / client:CostGuide():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:CostGuide(data)
  local EntityMod = require("entity.cost_guide_entity")
  if data == nil then
    if self._cost_guide == nil then
      self._cost_guide = EntityMod.new(self, nil)
    end
    return self._cost_guide
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Coverage():list() / client:Coverage():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Coverage(data)
  local EntityMod = require("entity.coverage_entity")
  if data == nil then
    if self._coverage == nil then
      self._coverage = EntityMod.new(self, nil)
    end
    return self._coverage
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Discover():list() / client:Discover():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Discover(data)
  local EntityMod = require("entity.discover_entity")
  if data == nil then
    if self._discover == nil then
      self._discover = EntityMod.new(self, nil)
    end
    return self._discover
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:History():list() / client:History():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:History(data)
  local EntityMod = require("entity.history_entity")
  if data == nil then
    if self._history == nil then
      self._history = EntityMod.new(self, nil)
    end
    return self._history
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Mcp():list() / client:Mcp():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Mcp(data)
  local EntityMod = require("entity.mcp_entity")
  if data == nil then
    if self._mcp == nil then
      self._mcp = EntityMod.new(self, nil)
    end
    return self._mcp
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Pricing():list() / client:Pricing():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Pricing(data)
  local EntityMod = require("entity.pricing_entity")
  if data == nil then
    if self._pricing == nil then
      self._pricing = EntityMod.new(self, nil)
    end
    return self._pricing
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Tco():list() / client:Tco():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Tco(data)
  local EntityMod = require("entity.tco_entity")
  if data == nil then
    if self._tco == nil then
      self._tco = EntityMod.new(self, nil)
    end
    return self._tco
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Usage():list() / client:Usage():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function PricingSDK:Usage(data)
  local EntityMod = require("entity.usage_entity")
  if data == nil then
    if self._usage == nil then
      self._usage = EntityMod.new(self, nil)
    end
    return self._usage
  end
  return EntityMod.new(self, data)
end




function PricingSDK.test(testopts, sdkopts)
  sdkopts = sdkopts or {}
  sdkopts = vs.clone(sdkopts)
  if type(sdkopts) ~= "table" then
    sdkopts = {}
  end

  testopts = testopts or {}
  testopts = vs.clone(testopts)
  if type(testopts) ~= "table" then
    testopts = {}
  end
  testopts["active"] = true

  vs.setpath(sdkopts, "feature.test", testopts)

  local sdk = PricingSDK.new(sdkopts)
  sdk.mode = "test"

  return sdk
end


return PricingSDK
