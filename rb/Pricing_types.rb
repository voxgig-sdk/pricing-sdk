# frozen_string_literal: true

# Typed models for the Pricing SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Compare entity data model.
class Compare
end

# Request payload for Compare#load.
#
# @!attribute [rw] slug
#   @return [String]
CompareLoadMatch = Struct.new(
  :slug,
  keyword_init: true
)

# CostGuide entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
CostGuide = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for CostGuide#load.
#
# @!attribute [rw] id
#   @return [String]
CostGuideLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Coverage entity data model.
class Coverage
end

# Request payload for Coverage#load.
#
# @!attribute [rw] field
#   @return [String, nil]
#
# @!attribute [rw] slug
#   @return [String]
CoverageLoadMatch = Struct.new(
  :field,
  :slug,
  keyword_init: true
)

# Discover entity data model.
class Discover
end

# Request payload for Discover#load.
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] has_free_tier
#   @return [Boolean, nil]
#
# @!attribute [rw] limit
#   @return [Integer, nil]
#
# @!attribute [rw] max_price
#   @return [Float, nil]
#
# @!attribute [rw] q
#   @return [String, nil]
DiscoverLoadMatch = Struct.new(
  :category,
  :has_free_tier,
  :limit,
  :max_price,
  :q,
  keyword_init: true
)

# History entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
History = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for History#load.
#
# @!attribute [rw] id
#   @return [String]
HistoryLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Mcp entity data model.
class Mcp
end

# Request payload for Mcp#create.
class McpCreateData
end

# Pricing entity data model.
#
# @!attribute [rw] attribution
#   @return [String]
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] discounts
#   @return [Hash, nil]
#
# @!attribute [rw] hiddenCosts
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] license
#   @return [Hash]
#
# @!attribute [rw] links
#   @return [Hash]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] positioning
#   @return [Hash, nil]
#
# @!attribute [rw] priceRange
#   @return [Hash, nil]
#
# @!attribute [rw] schemaVersion
#   @return [String, nil]
#
# @!attribute [rw] slug
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] tiers
#   @return [Array, nil]
#
# @!attribute [rw] verdict
#   @return [String, nil]
#
# @!attribute [rw] verification
#   @return [Hash, nil]
Pricing = Struct.new(
  :attribution,
  :category,
  :discounts,
  :hiddenCosts,
  :id,
  :license,
  :links,
  :name,
  :positioning,
  :priceRange,
  :schemaVersion,
  :slug,
  :source,
  :tiers,
  :verdict,
  :verification,
  keyword_init: true
)

# Request payload for Pricing#load.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] depth
#   @return [String, nil]
#
# @!attribute [rw] field
#   @return [String, nil]
PricingLoadMatch = Struct.new(
  :id,
  :depth,
  :field,
  keyword_init: true
)

# Tco entity data model.
#
# @!attribute [rw] billing
#   @return [String, nil]
#
# @!attribute [rw] seats
#   @return [Integer, nil]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] tier
#   @return [String, nil]
Tco = Struct.new(
  :billing,
  :seats,
  :slug,
  :tier,
  keyword_init: true
)

# Request payload for Tco#create.
#
# @!attribute [rw] billing
#   @return [String, nil]
#
# @!attribute [rw] seats
#   @return [Integer, nil]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] tier
#   @return [String, nil]
TcoCreateData = Struct.new(
  :billing,
  :seats,
  :slug,
  :tier,
  keyword_init: true
)

# Usage entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
Usage = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Usage#load.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] input_token
#   @return [Integer, nil]
#
# @!attribute [rw] model
#   @return [String, nil]
#
# @!attribute [rw] output_token
#   @return [Integer, nil]
UsageLoadMatch = Struct.new(
  :id,
  :input_token,
  :model,
  :output_token,
  keyword_init: true
)

