// Typed models for the Pricing SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Compare {
}

export interface CompareLoadMatch {
}

export interface CostGuide {
}

export interface CostGuideLoadMatch {
  id: string
}

export interface Coverage {
}

export interface CoverageLoadMatch {
}

export interface Discover {
}

export interface DiscoverLoadMatch {
}

export interface History {
}

export interface HistoryLoadMatch {
  id: string
}

export interface Mcp {
}

export interface McpCreateData {
}

export interface Pricing {
  attribution: string
  category?: string
  discounts?: Record<string, any>
  hiddenCosts?: any[]
  license: Record<string, any>
  links: Record<string, any>
  name?: string
  positioning?: Record<string, any>
  priceRange?: Record<string, any>
  schemaVersion?: string
  slug?: string
  source?: string
  tiers?: any[]
  verdict?: string
  verification?: Record<string, any>
}

export interface PricingLoadMatch {
  id?: string
}

export interface Tco {
  billing?: string
  seats?: number
  slug: string
  tier?: string
}

export interface TcoCreateData {
  billing?: string
  seats?: number
  slug: string
  tier?: string
}

export interface Usage {
}

export interface UsageLoadMatch {
  id: string
}

