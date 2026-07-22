# Pricing PHP SDK Reference

Complete API reference for the Pricing PHP SDK.


## PricingSDK

### Constructor

```php
require_once __DIR__ . '/pricing_sdk.php';

$client = new PricingSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PricingSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = PricingSDK::test();
```


### Instance Methods

#### `Compare($data = null)`

Create a new `CompareEntity` instance. Pass `null` for no initial data.

#### `CostGuide($data = null)`

Create a new `CostGuideEntity` instance. Pass `null` for no initial data.

#### `Coverage($data = null)`

Create a new `CoverageEntity` instance. Pass `null` for no initial data.

#### `Discover($data = null)`

Create a new `DiscoverEntity` instance. Pass `null` for no initial data.

#### `History($data = null)`

Create a new `HistoryEntity` instance. Pass `null` for no initial data.

#### `Mcp($data = null)`

Create a new `McpEntity` instance. Pass `null` for no initial data.

#### `Pricing($data = null)`

Create a new `PricingEntity` instance. Pass `null` for no initial data.

#### `Tco($data = null)`

Create a new `TcoEntity` instance. Pass `null` for no initial data.

#### `Usage($data = null)`

Create a new `UsageEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): PricingUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## CompareEntity

```php
$compare = $client->Compare();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Compare()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CompareEntity`

Create a new `CompareEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## CostGuideEntity

```php
$cost_guide = $client->CostGuide();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->CostGuide()->load(["id" => "cost_guide_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CostGuideEntity`

Create a new `CostGuideEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## CoverageEntity

```php
$coverage = $client->Coverage();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Coverage()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CoverageEntity`

Create a new `CoverageEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DiscoverEntity

```php
$discover = $client->Discover();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Discover()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DiscoverEntity`

Create a new `DiscoverEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## HistoryEntity

```php
$history = $client->History();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->History()->load(["id" => "history_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): HistoryEntity`

Create a new `HistoryEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## McpEntity

```php
$mcp = $client->Mcp();
```

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Mcp()->create([
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): McpEntity`

Create a new `McpEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PricingEntity

```php
$pricing = $client->Pricing();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `attribution` | `string` | Yes |  |
| `category` | `string` | No |  |
| `discount` | `array` | No |  |
| `hidden_cost` | `array` | No |  |
| `license` | `array` | Yes |  |
| `link` | `array` | Yes |  |
| `name` | `string` | No |  |
| `positioning` | `array` | No |  |
| `price_range` | `array` | No |  |
| `schema_version` | `string` | No |  |
| `slug` | `string` | No |  |
| `source` | `string` | No |  |
| `tier` | `array` | No |  |
| `verdict` | `string` | No |  |
| `verification` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Pricing()->load(["id" => "pricing_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PricingEntity`

Create a new `PricingEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TcoEntity

```php
$tco = $client->Tco();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing` | `string` | No |  |
| `seat` | `int` | No |  |
| `slug` | `string` | Yes |  |
| `tier` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Tco()->create([
  "slug" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TcoEntity`

Create a new `TcoEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## UsageEntity

```php
$usage = $client->Usage();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Usage()->load(["id" => "usage_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): UsageEntity`

Create a new `UsageEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new PricingSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

