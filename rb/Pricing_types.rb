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
class CompareLoadMatch
end

# CostGuide entity data model.
class CostGuide
end

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
class CoverageLoadMatch
end

# Discover entity data model.
class Discover
end

# Request payload for Discover#load.
class DiscoverLoadMatch
end

# History entity data model.
class History
end

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
# @!attribute [rw] discount
#   @return [Hash, nil]
#
# @!attribute [rw] hidden_cost
#   @return [Array, nil]
#
# @!attribute [rw] license
#   @return [Hash]
#
# @!attribute [rw] link
#   @return [Hash]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] positioning
#   @return [Hash, nil]
#
# @!attribute [rw] price_range
#   @return [Hash, nil]
#
# @!attribute [rw] schema_version
#   @return [String, nil]
#
# @!attribute [rw] slug
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] tier
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
  :discount,
  :hidden_cost,
  :license,
  :link,
  :name,
  :positioning,
  :price_range,
  :schema_version,
  :slug,
  :source,
  :tier,
  :verdict,
  :verification,
  keyword_init: true
)

# Request payload for Pricing#load.
#
# @!attribute [rw] id
#   @return [String, nil]
PricingLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Tco entity data model.
#
# @!attribute [rw] billing
#   @return [String, nil]
#
# @!attribute [rw] seat
#   @return [Integer, nil]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] tier
#   @return [String, nil]
Tco = Struct.new(
  :billing,
  :seat,
  :slug,
  :tier,
  keyword_init: true
)

# Request payload for Tco#create.
#
# @!attribute [rw] billing
#   @return [String, nil]
#
# @!attribute [rw] seat
#   @return [Integer, nil]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] tier
#   @return [String, nil]
TcoCreateData = Struct.new(
  :billing,
  :seat,
  :slug,
  :tier,
  keyword_init: true
)

# Usage entity data model.
class Usage
end

# Request payload for Usage#load.
#
# @!attribute [rw] id
#   @return [String]
UsageLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

