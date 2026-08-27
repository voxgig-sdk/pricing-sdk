<?php
declare(strict_types=1);

// Typed models for the Pricing SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Compare entity data model. */
class Compare
{
}

/** Request payload for Compare#load. */
class CompareLoadMatch
{
}

/** CostGuide entity data model. */
class CostGuide
{
    public ?string $id = null;
}

/** Request payload for CostGuide#load. */
class CostGuideLoadMatch
{
    public string $id;
}

/** Coverage entity data model. */
class Coverage
{
}

/** Request payload for Coverage#load. */
class CoverageLoadMatch
{
}

/** Discover entity data model. */
class Discover
{
}

/** Request payload for Discover#load. */
class DiscoverLoadMatch
{
}

/** History entity data model. */
class History
{
    public ?string $id = null;
}

/** Request payload for History#load. */
class HistoryLoadMatch
{
    public string $id;
}

/** Mcp entity data model. */
class Mcp
{
}

/** Request payload for Mcp#create. */
class McpCreateData
{
}

/** Pricing entity data model. */
class Pricing
{
    public string $attribution;
    public ?string $category = null;
    public ?array $discounts = null;
    public ?array $hiddenCosts = null;
    public ?string $id = null;
    public array $license;
    public array $links;
    public ?string $name = null;
    public ?array $positioning = null;
    public ?array $priceRange = null;
    public ?string $schemaVersion = null;
    public ?string $slug = null;
    public ?string $source = null;
    public ?array $tiers = null;
    public ?string $verdict = null;
    public ?array $verification = null;
}

/** Request payload for Pricing#load. */
class PricingLoadMatch
{
    public string $id;
}

/** Tco entity data model. */
class Tco
{
    public ?string $billing = null;
    public ?int $seats = null;
    public string $slug;
    public ?string $tier = null;
}

/** Request payload for Tco#create. */
class TcoCreateData
{
    public ?string $billing = null;
    public ?int $seats = null;
    public string $slug;
    public ?string $tier = null;
}

/** Usage entity data model. */
class Usage
{
    public ?string $id = null;
}

/** Request payload for Usage#load. */
class UsageLoadMatch
{
    public string $id;
}

