// Typed models for the Pricing SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/pricing-sdk/go/core"
)

// Compare is the typed data model for the compare entity.
type Compare struct {
}

// CompareLoadMatch is the typed request payload for Compare.LoadTyped.
type CompareLoadMatch struct {
}

// CostGuide is the typed data model for the cost_guide entity.
type CostGuide struct {
	Id *string `json:"id,omitempty"`
}

// CostGuideLoadMatch is the typed request payload for CostGuide.LoadTyped.
type CostGuideLoadMatch struct {
	Id string `json:"id"`
}

// Coverage is the typed data model for the coverage entity.
type Coverage struct {
}

// CoverageLoadMatch is the typed request payload for Coverage.LoadTyped.
type CoverageLoadMatch struct {
}

// Discover is the typed data model for the discover entity.
type Discover struct {
}

// DiscoverLoadMatch is the typed request payload for Discover.LoadTyped.
type DiscoverLoadMatch struct {
}

// History is the typed data model for the history entity.
type History struct {
	Id *string `json:"id,omitempty"`
}

// HistoryLoadMatch is the typed request payload for History.LoadTyped.
type HistoryLoadMatch struct {
	Id string `json:"id"`
}

// Mcp is the typed data model for the mcp entity.
type Mcp struct {
}

// McpCreateData is the typed request payload for Mcp.CreateTyped.
type McpCreateData struct {
}

// Pricing is the typed data model for the pricing entity.
type Pricing struct {
	Attribution string `json:"attribution"`
	Category *string `json:"category,omitempty"`
	Discounts *map[string]any `json:"discounts,omitempty"`
	HiddenCosts *[]any `json:"hiddenCosts,omitempty"`
	Id *string `json:"id,omitempty"`
	License map[string]any `json:"license"`
	Links map[string]any `json:"links"`
	Name *string `json:"name,omitempty"`
	Positioning *map[string]any `json:"positioning,omitempty"`
	PriceRange *map[string]any `json:"priceRange,omitempty"`
	SchemaVersion *string `json:"schemaVersion,omitempty"`
	Slug *string `json:"slug,omitempty"`
	Source *string `json:"source,omitempty"`
	Tiers *[]any `json:"tiers,omitempty"`
	Verdict *string `json:"verdict,omitempty"`
	Verification *map[string]any `json:"verification,omitempty"`
}

// PricingLoadMatch is the typed request payload for Pricing.LoadTyped.
type PricingLoadMatch struct {
	Id string `json:"id"`
}

// Tco is the typed data model for the tco entity.
type Tco struct {
	Billing *string `json:"billing,omitempty"`
	Seats *int `json:"seats,omitempty"`
	Slug string `json:"slug"`
	Tier *string `json:"tier,omitempty"`
}

// TcoCreateData is the typed request payload for Tco.CreateTyped.
type TcoCreateData struct {
	Billing *string `json:"billing,omitempty"`
	Seats *int `json:"seats,omitempty"`
	Slug string `json:"slug"`
	Tier *string `json:"tier,omitempty"`
}

// Usage is the typed data model for the usage entity.
type Usage struct {
	Id *string `json:"id,omitempty"`
}

// UsageLoadMatch is the typed request payload for Usage.LoadTyped.
type UsageLoadMatch struct {
	Id string `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
