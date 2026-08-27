# Pricing Golang SDK Reference

Complete API reference for the Pricing Golang SDK.


## PricingSDK

### Constructor

```go
func NewPricingSDK(options map[string]any) *PricingSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *PricingSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *PricingSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Compare(data map[string]any) PricingEntity`

Create a new `Compare` entity instance. Pass `nil` for no initial data.

#### `CostGuide(data map[string]any) PricingEntity`

Create a new `CostGuide` entity instance. Pass `nil` for no initial data.

#### `Coverage(data map[string]any) PricingEntity`

Create a new `Coverage` entity instance. Pass `nil` for no initial data.

#### `Discover(data map[string]any) PricingEntity`

Create a new `Discover` entity instance. Pass `nil` for no initial data.

#### `History(data map[string]any) PricingEntity`

Create a new `History` entity instance. Pass `nil` for no initial data.

#### `Mcp(data map[string]any) PricingEntity`

Create a new `Mcp` entity instance. Pass `nil` for no initial data.

#### `Pricing(data map[string]any) PricingEntity`

Create a new `Pricing` entity instance. Pass `nil` for no initial data.

#### `Tco(data map[string]any) PricingEntity`

Create a new `Tco` entity instance. Pass `nil` for no initial data.

#### `Usage(data map[string]any) PricingEntity`

Create a new `Usage` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## CompareEntity

```go
compare := client.Compare(nil)
fmt.Println(compare.GetName()) // "compare"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Compare(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CompareEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CostGuideEntity

```go
costGuide := client.CostGuide(nil)
fmt.Println(costGuide.GetName()) // "cost_guide"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.CostGuide(nil).Load(map[string]any{"id": "cost_guide_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CostGuideEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CoverageEntity

```go
coverage := client.Coverage(nil)
fmt.Println(coverage.GetName()) // "coverage"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Coverage(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CoverageEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DiscoverEntity

```go
discover := client.Discover(nil)
fmt.Println(discover.GetName()) // "discover"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Discover(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DiscoverEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## HistoryEntity

```go
history := client.History(nil)
fmt.Println(history.GetName()) // "history"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.History(nil).Load(map[string]any{"id": "history_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `HistoryEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## McpEntity

```go
mcp := client.Mcp(nil)
fmt.Println(mcp.GetName()) // "mcp"
```

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Mcp(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `McpEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PricingEntity

```go
pricing := client.Pricing(nil)
fmt.Println(pricing.GetName()) // "pricing"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `attribution` | `string` | Yes | Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, "{product} pricing" -> links.page). |
| `category` | `string` | No |  |
| `discounts` | `map[string]any` | No | Per-tier annual savings + best available. |
| `hiddenCosts` | `[]any` | No |  |
| `id` | `string` | No |  |
| `license` | `map[string]any` | Yes | Per-field license: owned = free to cite with attribution; restricted = display only. |
| `links` | `map[string]any` | Yes | Citation links on every record. |
| `name` | `string` | No |  |
| `positioning` | `map[string]any` | No | Starting price vs category median/min/max + sample size. |
| `priceRange` | `map[string]any` | No |  |
| `schemaVersion` | `string` | No |  |
| `slug` | `string` | No |  |
| `source` | `string` | No | The vendor URL the price was read from. |
| `tiers` | `[]any` | No |  |
| `verdict` | `string` | No |  |
| `verification` | `map[string]any` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Pricing(nil).Load(map[string]any{"id": "pricing_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PricingEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TcoEntity

```go
tco := client.Tco(nil)
fmt.Println(tco.GetName()) // "tco"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing` | `string` | No |  |
| `seats` | `int` | No |  |
| `slug` | `string` | Yes |  |
| `tier` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Tco(nil).Create(map[string]any{
    "slug": "example_slug",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TcoEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## UsageEntity

```go
usage := client.Usage(nil)
fmt.Println(usage.GetName()) // "usage"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Usage(nil).Load(map[string]any{"id": "usage_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `UsageEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewPricingSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

