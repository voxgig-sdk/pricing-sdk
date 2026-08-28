# Pricing TypeScript SDK Reference

Complete API reference for the Pricing TypeScript SDK.


## PricingSDK

### Constructor

```ts
new PricingSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PricingSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = PricingSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `PricingSDK` instance in test mode.


### Instance Methods

#### `Compare(data?: object)`

Create a new `Compare` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CompareEntity` instance.

#### `CostGuide(data?: object)`

Create a new `CostGuide` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CostGuideEntity` instance.

#### `Coverage(data?: object)`

Create a new `Coverage` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CoverageEntity` instance.

#### `Discover(data?: object)`

Create a new `Discover` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DiscoverEntity` instance.

#### `History(data?: object)`

Create a new `History` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `HistoryEntity` instance.

#### `Mcp(data?: object)`

Create a new `Mcp` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `McpEntity` instance.

#### `Pricing(data?: object)`

Create a new `Pricing` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PricingEntity` instance.

#### `Tco(data?: object)`

Create a new `Tco` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TcoEntity` instance.

#### `Usage(data?: object)`

Create a new `Usage` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `UsageEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `PricingSDK.test()`.

**Returns:** `PricingSDK` instance in test mode.


---

## CompareEntity

```ts
const compare = client.Compare()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Compare().load({ slug: 'slug' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CompareEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## CostGuideEntity

```ts
const cost_guide = client.CostGuide()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.CostGuide().load({ id: 'cost_guide_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CostGuideEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## CoverageEntity

```ts
const coverage = client.Coverage()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Coverage().load({ slug: 'slug' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CoverageEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DiscoverEntity

```ts
const discover = client.Discover()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Discover().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DiscoverEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## HistoryEntity

```ts
const history = client.History()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.History().load({ id: 'history_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `HistoryEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## McpEntity

```ts
const mcp = client.Mcp()
```

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Mcp().create({
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `McpEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PricingEntity

```ts
const pricing = client.Pricing()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `attribution` | `string` | Yes | Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, "{product} pricing" -> links.page). |
| `category` | `string` | No |  |
| `discounts` | `Record<string, any>` | No | Per-tier annual savings + best available. |
| `hiddenCosts` | `any[]` | No |  |
| `id` | `string` | No |  |
| `license` | `Record<string, any>` | Yes | Per-field license: owned = free to cite with attribution; restricted = display only. |
| `links` | `Record<string, any>` | Yes | Citation links on every record. |
| `name` | `string` | No |  |
| `positioning` | `Record<string, any>` | No | Starting price vs category median/min/max + sample size. |
| `priceRange` | `Record<string, any>` | No |  |
| `schemaVersion` | `string` | No |  |
| `slug` | `string` | No |  |
| `source` | `string` | No | The vendor URL the price was read from. |
| `tiers` | `any[]` | No |  |
| `verdict` | `string` | No |  |
| `verification` | `Record<string, any>` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Pricing().load({ id: 'pricing_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PricingEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TcoEntity

```ts
const tco = client.Tco()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing` | `string` | No |  |
| `seats` | `number` | No |  |
| `slug` | `string` | Yes |  |
| `tier` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Tco().create({
  slug: 'example_slug',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TcoEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## UsageEntity

```ts
const usage = client.Usage()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Usage().load({ id: 'usage_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `UsageEntity` instance with the same client and
options.

#### `client()`

Return the parent `PricingSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new PricingSDK({
  feature: {
    test: { active: true },
  }
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

