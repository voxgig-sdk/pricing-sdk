# Pricing Python SDK Reference

Complete API reference for the Pricing Python SDK.


## PricingSDK

### Constructor

```python
from pricing_sdk import PricingSDK

client = PricingSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PricingSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = PricingSDK.test()
```


### Instance Methods

#### `Compare(data=None)`

Create a new `CompareEntity` instance. Pass `None` for no initial data.

#### `CostGuide(data=None)`

Create a new `CostGuideEntity` instance. Pass `None` for no initial data.

#### `Coverage(data=None)`

Create a new `CoverageEntity` instance. Pass `None` for no initial data.

#### `Discover(data=None)`

Create a new `DiscoverEntity` instance. Pass `None` for no initial data.

#### `History(data=None)`

Create a new `HistoryEntity` instance. Pass `None` for no initial data.

#### `Mcp(data=None)`

Create a new `McpEntity` instance. Pass `None` for no initial data.

#### `Pricing(data=None)`

Create a new `PricingEntity` instance. Pass `None` for no initial data.

#### `Tco(data=None)`

Create a new `TcoEntity` instance. Pass `None` for no initial data.

#### `Usage(data=None)`

Create a new `UsageEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## CompareEntity

```python
compare = client.Compare()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Compare().load({"slug": "slug"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CompareEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CostGuideEntity

```python
cost_guide = client.CostGuide()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.CostGuide().load({"id": "cost_guide_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CostGuideEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## CoverageEntity

```python
coverage = client.Coverage()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Coverage().load({"slug": "slug"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CoverageEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DiscoverEntity

```python
discover = client.Discover()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Discover().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DiscoverEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## HistoryEntity

```python
history = client.History()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.History().load({"id": "history_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HistoryEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## McpEntity

```python
mcp = client.Mcp()
```

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Mcp().create({
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `McpEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PricingEntity

```python
pricing = client.Pricing()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `attribution` | `str` | Yes | Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, "{product} pricing" -> links.page). |
| `category` | `str` | No |  |
| `discounts` | `dict` | No | Per-tier annual savings + best available. |
| `hiddenCosts` | `list` | No |  |
| `id` | `str` | No |  |
| `license` | `dict` | Yes | Per-field license: owned = free to cite with attribution; restricted = display only. |
| `links` | `dict` | Yes | Citation links on every record. |
| `name` | `str` | No |  |
| `positioning` | `dict` | No | Starting price vs category median/min/max + sample size. |
| `priceRange` | `dict` | No |  |
| `schemaVersion` | `str` | No |  |
| `slug` | `str` | No |  |
| `source` | `str` | No | The vendor URL the price was read from. |
| `tiers` | `list` | No |  |
| `verdict` | `str` | No |  |
| `verification` | `dict` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Pricing().load({"id": "pricing_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PricingEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TcoEntity

```python
tco = client.Tco()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing` | `str` | No |  |
| `seats` | `int` | No |  |
| `slug` | `str` | Yes |  |
| `tier` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Tco().create({
    "slug": "example_slug",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TcoEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## UsageEntity

```python
usage = client.Usage()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Usage().load({"id": "usage_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UsageEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = PricingSDK({
    "feature": {
        "test": {"active": True},
    },
})
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

