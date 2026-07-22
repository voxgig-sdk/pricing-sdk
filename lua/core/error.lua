-- Pricing SDK error

local PricingError = {}
PricingError.__index = PricingError


function PricingError.new(code, msg, ctx)
  local self = setmetatable({}, PricingError)
  self.is_sdk_error = true
  self.sdk = "Pricing"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function PricingError:error()
  return self.msg
end


function PricingError:__tostring()
  return self.msg
end


return PricingError
