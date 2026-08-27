# Pricing Ruby SDK



The Ruby SDK for the Pricing API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Compare` — with named operations (`load`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/pricing-sdk/releases](https://github.com/voxgig-sdk/pricing-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Pricing_sdk"

client = PricingSDK.new
```

### 3. Load a compare

```ruby
begin
  # load returns the ENTITY — call data_get for the Compare record (raises on error).
  compare = client.Compare.load()
  puts compare
rescue => err
  warn "load failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  history = client.History.load({ "id" => "example_id" })
rescue => err
  warn "load failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```ruby
client = PricingSDK.test({
  "entity" => { "history" => { "test01" => { "id" => "test01" } } },
})

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
history = client.History.load({ "id" => "test01" })
puts history
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = PricingSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
PRICING_TEST_LIVE=TRUE
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### PricingSDK

```ruby
require_relative "Pricing_sdk"
client = PricingSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = PricingSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### PricingSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `Compare` | `(data) -> CompareEntity` | Create a Compare entity instance. |
| `CostGuide` | `(data) -> CostGuideEntity` | Create a CostGuide entity instance. |
| `Coverage` | `(data) -> CoverageEntity` | Create a Coverage entity instance. |
| `Discover` | `(data) -> DiscoverEntity` | Create a Discover entity instance. |
| `History` | `(data) -> HistoryEntity` | Create a History entity instance. |
| `Mcp` | `(data) -> McpEntity` | Create a Mcp entity instance. |
| `Pricing` | `(data) -> PricingEntity` | Create a Pricing entity instance. |
| `Tco` | `(data) -> TcoEntity` | Create a Tco entity instance. |
| `Usage` | `(data) -> UsageEntity` | Create an Usage entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `PricingError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

### Entities

#### Compare

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/v2/compare`

#### CostGuide

| Field | Description |
| --- | --- |
| `id` |  |

Operations: Load.

API path: `/api/v2/cost-guide/{slug}`

#### Coverage

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/v2/coverage`

#### Discover

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/v2/discover`

#### History

| Field | Description |
| --- | --- |
| `id` |  |

Operations: Load.

API path: `/api/v2/history/{slug}`

#### Mcp

| Field | Description |
| --- | --- |

Operations: Create.

API path: `/api/mcp`

#### Pricing

| Field | Description |
| --- | --- |
| `attribution` | Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, "{product} pricing" -> links.page). |
| `category` |  |
| `discounts` | Per-tier annual savings + best available. |
| `hiddenCosts` |  |
| `id` |  |
| `license` | Per-field license: owned = free to cite with attribution; restricted = display only. |
| `links` | Citation links on every record. |
| `name` |  |
| `positioning` | Starting price vs category median/min/max + sample size. |
| `priceRange` |  |
| `schemaVersion` |  |
| `slug` |  |
| `source` | The vendor URL the price was read from. |
| `tiers` |  |
| `verdict` |  |
| `verification` |  |

Operations: Load.

API path: `/api/v2/pricing/{slug}`

#### Tco

| Field | Description |
| --- | --- |
| `billing` |  |
| `seats` |  |
| `slug` |  |
| `tier` |  |

Operations: Create.

API path: `/api/v2/tco`

#### Usage

| Field | Description |
| --- | --- |
| `id` |  |

Operations: Load.

API path: `/api/v2/usage/{slug}`



## Entities


### Compare

Create an instance: `compare = client.Compare`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Compare record (raises on error).
compare = client.Compare.load()
```


### CostGuide

Create an instance: `cost_guide = client.CostGuide`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the CostGuide record (raises on error).
cost_guide = client.CostGuide.load({ "id" => "cost_guide_id" })
```


### Coverage

Create an instance: `coverage = client.Coverage`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Coverage record (raises on error).
coverage = client.Coverage.load()
```


### Discover

Create an instance: `discover = client.Discover`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Discover record (raises on error).
discover = client.Discover.load()
```


### History

Create an instance: `history = client.History`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the History record (raises on error).
history = client.History.load({ "id" => "history_id" })
```


### Mcp

Create an instance: `mcp = client.Mcp`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```ruby
mcp = client.Mcp.create({
})
```


### Pricing

Create an instance: `pricing = client.Pricing`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `attribution` | `String` | Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, "{product} pricing" -> links.page). |
| `category` | `String` |  |
| `discounts` | `Hash` | Per-tier annual savings + best available. |
| `hiddenCosts` | `Array` |  |
| `id` | `String` |  |
| `license` | `Hash` | Per-field license: owned = free to cite with attribution; restricted = display only. |
| `links` | `Hash` | Citation links on every record. |
| `name` | `String` |  |
| `positioning` | `Hash` | Starting price vs category median/min/max + sample size. |
| `priceRange` | `Hash` |  |
| `schemaVersion` | `String` |  |
| `slug` | `String` |  |
| `source` | `String` | The vendor URL the price was read from. |
| `tiers` | `Array` |  |
| `verdict` | `String` |  |
| `verification` | `Hash` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Pricing record (raises on error).
pricing = client.Pricing.load({ "id" => "pricing_id" })
```


### Tco

Create an instance: `tco = client.Tco`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing` | `String` |  |
| `seats` | `Integer` |  |
| `slug` | `String` |  |
| `tier` | `String` |  |

#### Example: Create

```ruby
tco = client.Tco.create({
  "slug" => "example_slug", # String
})
```


### Usage

Create an instance: `usage = client.Usage`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Usage record (raises on error).
usage = client.Usage.load({ "id" => "usage_id" })
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── Pricing_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`Pricing_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
history = client.History
history.load({ "id" => "example_id" })

# history.data_get now returns the history data from the last load
# history.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
