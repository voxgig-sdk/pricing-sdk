-- Typed models for the Pricing SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Compare

---@class CompareLoadMatch
---@field slug string

---@class CostGuide
---@field id? string

---@class CostGuideLoadMatch
---@field id string

---@class Coverage

---@class CoverageLoadMatch
---@field field? string
---@field slug string

---@class Discover

---@class DiscoverLoadMatch
---@field category? string
---@field has_free_tier? boolean
---@field limit? number
---@field max_price? number
---@field q? string

---@class History
---@field id? string

---@class HistoryLoadMatch
---@field id string

---@class Mcp

---@class McpCreateData

---@class Pricing
---@field attribution string
---@field category? string
---@field discounts? table
---@field hiddenCosts? table
---@field id? string
---@field license table
---@field links table
---@field name? string
---@field positioning? table
---@field priceRange? table
---@field schemaVersion? string
---@field slug? string
---@field source? string
---@field tiers? table
---@field verdict? string
---@field verification? table

---@class PricingLoadMatch
---@field id string
---@field depth? string
---@field field? string

---@class Tco
---@field billing? string
---@field seats? number
---@field slug string
---@field tier? string

---@class TcoCreateData
---@field billing? string
---@field seats? number
---@field slug string
---@field tier? string

---@class Usage
---@field id? string

---@class UsageLoadMatch
---@field id string
---@field input_token? number
---@field model? string
---@field output_token? number

local M = {}

return M
