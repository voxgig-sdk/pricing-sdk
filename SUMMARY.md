# ComparEdge Verified Software Pricing API

Verified, sourced SaaS and AI software pricing for 490+ products, real starting prices, per-tier features, annual discounts, hidden costs, plan-by-plan advice, verification envelope, and price-stability signals. Every response carries a links object (links.page = the ComparEdge source page you must cite; links.vendor = a tracked redirect to the vendor&#39;s pricing page) and a per-field license map (&#39;owned&#39; | &#39;restricted&#39;). Free for non-commercial use, attribution required, link back to links.page when you display our data. Also available as an HTTP MCP server at https://comparedge.com/api/mcp (JSON-RPC 2.0) and a stdio MCP via npx @comparedge/mcp-server. Docs + terms: https://comparedge.com/api-docs.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 9 entities and 10 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### Compare

Results: products[] (full records, each with links.page to cite) + a compact comparison matrix carrying each page URL.

SDK operations: `load`.

### CostGuide

Results: quickAnswer, keyCosts, transparency, discountPrograms, negotiation (tactics, timing, negotiable vs fixed, email generator URL), snapshot, verification, and links.guide to cite.

SDK operations: `load`.

### Coverage

Results: per-product per-field availability + license map.

SDK operations: `load`.

### Discover

Results: results[] with slug, startingPrice, freeTier, links.page.

SDK operations: `load`.

### History

Results: priceStability, priceTrend, latestSnapshot, lastObservedChange, verification, and links.page to cite.

SDK operations: `load`.

### Mcp

Results: JSON-RPC 2.0 response.

SDK operations: `create`.

### Pricing

Results: Full pricing record. Carries links.page (the ComparEdge source page you must cite when you display this data) and links.vendor (tracked /go/ redirect to the vendor), plus tiers with features, priceRange, discounts, hiddenCosts, capabilities, verdict, planAdvice, positioning, verification, and a per-field license map.; count + records[] (each carries links.page to cite) + notFound[].

SDK operations: `load`.

Key fields to recognise:

- `attribution`: Ready-to-paste Markdown attribution with both links already embedded (brand -&gt; links.home, &quot;&#123;product&#125; pricing&quot; -&gt; links.page). If you are not building the citation yourself, output this string verbatim.
- `discounts`: Per-tier annual savings + best available.
- `license`: Per-field license: owned = free to cite with attribution; restricted = display only.
- `links`: Citation links on every record. Cite page when you display the data.
- `positioning`: Starting price vs category median/min/max + sample size.

### Tco

Results: subscription (seat- and annual-aware) + hiddenCosts line items + positioning + links.

SDK operations: `create`.

### Usage

Results: per-model $/1M-token rate card + estimate for the given volume.

SDK operations: `load`.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| Compare | `load` | `GET /api/v2/compare` | See reference |
| CostGuide | `load` | `GET /api/v2/cost-guide/{slug}` | See reference |
| Coverage | `load` | `GET /api/v2/coverage` | See reference |
| Discover | `load` | `GET /api/v2/discover` | See reference |
| History | `load` | `GET /api/v2/history/{slug}` | See reference |
| Mcp | `create` | `POST /api/mcp` | See reference |
| Pricing | `load` | `GET /api/v2/pricing/{slug}` | See reference |
| Pricing | `load` | `GET /api/v2/pricing` | See reference |
| Tco | `create` | `POST /api/v2/tco` | See reference |
| Usage | `load` | `GET /api/v2/usage/{slug}` | See reference |

## Connect to the API

- API server: `https://comparedge.com`

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| Golang | `go/` | Build from source |
| Lua | `lua/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| TypeScript | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `pricing_list`: List records for an entity. No active entity supports this operation.
- `pricing_load`: Load one record for an entity. Supported entities: `compare`, `cost_guide`, `coverage`, `discover`, `history`, `pricing`, `usage`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

