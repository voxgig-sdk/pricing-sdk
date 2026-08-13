# Pricing Ruby SDK Reference

Complete API reference for the Pricing Ruby SDK.


## PricingSDK

### Constructor

```ruby
require_relative 'Pricing_sdk'

client = PricingSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PricingSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = PricingSDK.test
```


### Instance Methods

#### `Compare(data = nil)`

Create a new `Compare` entity instance. Pass `nil` for no initial data.

#### `CostGuide(data = nil)`

Create a new `CostGuide` entity instance. Pass `nil` for no initial data.

#### `Coverage(data = nil)`

Create a new `Coverage` entity instance. Pass `nil` for no initial data.

#### `Discover(data = nil)`

Create a new `Discover` entity instance. Pass `nil` for no initial data.

#### `History(data = nil)`

Create a new `History` entity instance. Pass `nil` for no initial data.

#### `Mcp(data = nil)`

Create a new `Mcp` entity instance. Pass `nil` for no initial data.

#### `Pricing(data = nil)`

Create a new `Pricing` entity instance. Pass `nil` for no initial data.

#### `Tco(data = nil)`

Create a new `Tco` entity instance. Pass `nil` for no initial data.

#### `Usage(data = nil)`

Create a new `Usage` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## CompareEntity

```ruby
compare = client.Compare
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Compare.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CompareEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## CostGuideEntity

```ruby
cost_guide = client.CostGuide
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.CostGuide.load({ "id" => "cost_guide_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CostGuideEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## CoverageEntity

```ruby
coverage = client.Coverage
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Coverage.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CoverageEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DiscoverEntity

```ruby
discover = client.Discover
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Discover.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DiscoverEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## HistoryEntity

```ruby
history = client.History
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.History.load({ "id" => "history_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `HistoryEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## McpEntity

```ruby
mcp = client.Mcp
```

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Mcp.create({
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `McpEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PricingEntity

```ruby
pricing = client.Pricing
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `attribution` | `String` | Yes |  |
| `category` | `String` | No |  |
| `discounts` | `Hash` | No |  |
| `hiddenCosts` | `Array` | No |  |
| `license` | `Hash` | Yes |  |
| `links` | `Hash` | Yes |  |
| `name` | `String` | No |  |
| `positioning` | `Hash` | No |  |
| `priceRange` | `Hash` | No |  |
| `schemaVersion` | `String` | No |  |
| `slug` | `String` | No |  |
| `source` | `String` | No |  |
| `tiers` | `Array` | No |  |
| `verdict` | `String` | No |  |
| `verification` | `Hash` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Pricing.load({ "id" => "pricing_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PricingEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TcoEntity

```ruby
tco = client.Tco
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing` | `String` | No |  |
| `seats` | `Integer` | No |  |
| `slug` | `String` | Yes |  |
| `tier` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Tco.create({
  "slug" => "example_slug", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TcoEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## UsageEntity

```ruby
usage = client.Usage
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Usage.load({ "id" => "usage_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `UsageEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = PricingSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

