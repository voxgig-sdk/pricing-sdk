# Pricing Golang SDK



The Golang SDK for the Pricing API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Compare(nil)` — each with the same small set of operations (`Load`, `Create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/pricing-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/pricing-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/pricing-sdk/go=../pricing-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    sdk "github.com/voxgig-sdk/pricing-sdk/go"
)

func main() {
    client := sdk.New()

    // Load a single compare — the value is the loaded record.
    compare, err := client.Compare(nil).Load(nil, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(compare)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
compare, err := client.Compare(nil).Load(nil, nil)
if err != nil {
    // handle err
    return
}
_ = compare
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

compare, err := client.Compare(nil).Load(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(compare) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewPricingSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewPricingSDK

```go
func NewPricingSDK(options map[string]any) *PricingSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *PricingSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### PricingSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Compare` | `(data map[string]any) PricingEntity` | Create a Compare entity instance. |
| `CostGuide` | `(data map[string]any) PricingEntity` | Create a CostGuide entity instance. |
| `Coverage` | `(data map[string]any) PricingEntity` | Create a Coverage entity instance. |
| `Discover` | `(data map[string]any) PricingEntity` | Create a Discover entity instance. |
| `History` | `(data map[string]any) PricingEntity` | Create a History entity instance. |
| `Mcp` | `(data map[string]any) PricingEntity` | Create a Mcp entity instance. |
| `Pricing` | `(data map[string]any) PricingEntity` | Create a Pricing entity instance. |
| `Tco` | `(data map[string]any) PricingEntity` | Create a Tco entity instance. |
| `Usage` | `(data map[string]any) PricingEntity` | Create an Usage entity instance. |

### Entity interface (PricingEntity)

All entities implement the `PricingEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` | the entity record (`map[string]any`) |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    compare, err := client.Compare(nil).Load(nil, nil)
    if err != nil { /* handle */ }
    // compare is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### Compare

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/v2/compare`

#### CostGuide

| Field | Description |
| --- | --- |

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
| `"attribution"` |  |
| `"category"` |  |
| `"discounts"` |  |
| `"hiddenCosts"` |  |
| `"license"` |  |
| `"links"` |  |
| `"name"` |  |
| `"positioning"` |  |
| `"priceRange"` |  |
| `"schemaVersion"` |  |
| `"slug"` |  |
| `"source"` |  |
| `"tiers"` |  |
| `"verdict"` |  |
| `"verification"` |  |

Operations: Load.

API path: `/api/v2/pricing/{slug}`

#### Tco

| Field | Description |
| --- | --- |
| `"billing"` |  |
| `"seats"` |  |
| `"slug"` |  |
| `"tier"` |  |

Operations: Create.

API path: `/api/v2/tco`

#### Usage

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/v2/usage/{slug}`



## Entities


### Compare

Create an instance: `compare := client.Compare(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
compare, err := client.Compare(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(compare) // the loaded record
```


### CostGuide

Create an instance: `costGuide := client.CostGuide(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
costGuide, err := client.CostGuide(nil).Load(map[string]any{"id": "cost_guide_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(costGuide) // the loaded record
```


### Coverage

Create an instance: `coverage := client.Coverage(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
coverage, err := client.Coverage(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(coverage) // the loaded record
```


### Discover

Create an instance: `discover := client.Discover(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
discover, err := client.Discover(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(discover) // the loaded record
```


### History

Create an instance: `history := client.History(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
history, err := client.History(nil).Load(map[string]any{"id": "history_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(history) // the loaded record
```


### Mcp

Create an instance: `mcp := client.Mcp(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Example: Create

```go
result, err := client.Mcp(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Pricing

Create an instance: `pricing := client.Pricing(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `attribution` | `string` |  |
| `category` | `string` |  |
| `discounts` | `map[string]any` |  |
| `hiddenCosts` | `[]any` |  |
| `license` | `map[string]any` |  |
| `links` | `map[string]any` |  |
| `name` | `string` |  |
| `positioning` | `map[string]any` |  |
| `priceRange` | `map[string]any` |  |
| `schemaVersion` | `string` |  |
| `slug` | `string` |  |
| `source` | `string` |  |
| `tiers` | `[]any` |  |
| `verdict` | `string` |  |
| `verification` | `map[string]any` |  |

#### Example: Load

```go
pricing, err := client.Pricing(nil).Load(map[string]any{"id": "pricing_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(pricing) // the loaded record
```


### Tco

Create an instance: `tco := client.Tco(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing` | `string` |  |
| `seats` | `int` |  |
| `slug` | `string` |  |
| `tier` | `string` |  |

#### Example: Create

```go
result, err := client.Tco(nil).Create(map[string]any{
    "slug": "example_slug",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Usage

Create an instance: `usage := client.Usage(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
usage, err := client.Usage(nil).Load(map[string]any{"id": "usage_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(usage) // the loaded record
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/pricing-sdk/go/
├── pricing.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/pricing-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
compare := client.Compare(nil)
compare.Load(nil, nil)

// compare.Data() now returns the compare data from the last load
// compare.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
