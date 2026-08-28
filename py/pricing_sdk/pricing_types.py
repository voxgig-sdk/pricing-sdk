# Typed models for the Pricing SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Compare(TypedDict):
    pass


class CompareLoadMatch(TypedDict):
    slug: str


class CostGuide(TypedDict, total=False):
    id: str


class CostGuideLoadMatch(TypedDict):
    id: str


class Coverage(TypedDict):
    pass


class CoverageLoadMatchRequired(TypedDict):
    slug: str


class CoverageLoadMatch(CoverageLoadMatchRequired, total=False):
    field: str


class Discover(TypedDict):
    pass


class DiscoverLoadMatch(TypedDict, total=False):
    category: str
    has_free_tier: bool
    limit: int
    max_price: float
    q: str


class History(TypedDict, total=False):
    id: str


class HistoryLoadMatch(TypedDict):
    id: str


class Mcp(TypedDict):
    pass


class McpCreateData(TypedDict):
    pass


class PricingRequired(TypedDict):
    attribution: str
    license: dict
    links: dict


class Pricing(PricingRequired, total=False):
    category: str
    discounts: dict
    hiddenCosts: list
    id: str
    name: str
    positioning: dict
    priceRange: dict
    schemaVersion: str
    slug: str
    source: str
    tiers: list
    verdict: str
    verification: dict


class PricingLoadMatchRequired(TypedDict):
    id: str


class PricingLoadMatch(PricingLoadMatchRequired, total=False):
    depth: str
    field: str


class TcoRequired(TypedDict):
    slug: str


class Tco(TcoRequired, total=False):
    billing: str
    seats: int
    tier: str


class TcoCreateDataRequired(TypedDict):
    slug: str


class TcoCreateData(TcoCreateDataRequired, total=False):
    billing: str
    seats: int
    tier: str


class Usage(TypedDict, total=False):
    id: str


class UsageLoadMatchRequired(TypedDict):
    id: str


class UsageLoadMatch(UsageLoadMatchRequired, total=False):
    input_token: int
    model: str
    output_token: int
