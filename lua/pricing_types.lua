-- Typed models for the Pricing SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Compare

---@class CompareLoadMatch

---@class CostGuide

---@class CostGuideLoadMatch
---@field id string

---@class Coverage

---@class CoverageLoadMatch

---@class Discover

---@class DiscoverLoadMatch

---@class History

---@class HistoryLoadMatch
---@field id string

---@class Mcp

---@class McpCreateData

---@class Pricing
---@field attribution string
---@field category? string
---@field discounts? table
---@field hiddenCosts? table
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
---@field id? string

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

---@class UsageLoadMatch
---@field id string

local M = {}

return M
