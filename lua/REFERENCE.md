# Pricing Lua SDK Reference

Complete API reference for the Pricing Lua SDK.


## PricingSDK

### Constructor

```lua
local sdk = require("pricing_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Compare(data)`

Create a new `Compare` entity instance. Pass `nil` for no initial data.

#### `CostGuide(data)`

Create a new `CostGuide` entity instance. Pass `nil` for no initial data.

#### `Coverage(data)`

Create a new `Coverage` entity instance. Pass `nil` for no initial data.

#### `Discover(data)`

Create a new `Discover` entity instance. Pass `nil` for no initial data.

#### `History(data)`

Create a new `History` entity instance. Pass `nil` for no initial data.

#### `Mcp(data)`

Create a new `Mcp` entity instance. Pass `nil` for no initial data.

#### `Pricing(data)`

Create a new `Pricing` entity instance. Pass `nil` for no initial data.

#### `Tco(data)`

Create a new `Tco` entity instance. Pass `nil` for no initial data.

#### `Usage(data)`

Create a new `Usage` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## CompareEntity

```lua
local compare = client:Compare(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Compare():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CompareEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CostGuideEntity

```lua
local cost_guide = client:CostGuide(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:CostGuide():load({ id = "cost_guide_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CostGuideEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CoverageEntity

```lua
local coverage = client:Coverage(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Coverage():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CoverageEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DiscoverEntity

```lua
local discover = client:Discover(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Discover():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DiscoverEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## HistoryEntity

```lua
local history = client:History(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:History():load({ id = "history_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HistoryEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## McpEntity

```lua
local mcp = client:Mcp(nil)
```

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Mcp():create({
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `McpEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PricingEntity

```lua
local pricing = client:Pricing(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `attribution` | `string` | Yes |  |
| `category` | `string` | No |  |
| `discount` | `table` | No |  |
| `hidden_cost` | `table` | No |  |
| `license` | `table` | Yes |  |
| `link` | `table` | Yes |  |
| `name` | `string` | No |  |
| `positioning` | `table` | No |  |
| `price_range` | `table` | No |  |
| `schema_version` | `string` | No |  |
| `slug` | `string` | No |  |
| `source` | `string` | No |  |
| `tier` | `table` | No |  |
| `verdict` | `string` | No |  |
| `verification` | `table` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Pricing():load({ id = "pricing_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PricingEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TcoEntity

```lua
local tco = client:Tco(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing` | `string` | No |  |
| `seat` | `number` | No |  |
| `slug` | `string` | Yes |  |
| `tier` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Tco():create({
  slug = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TcoEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## UsageEntity

```lua
local usage = client:Usage(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Usage():load({ id = "usage_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UsageEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

