// Typed models for the Pricing SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Compare is the typed data model for the compare entity.
type Compare struct {
}

// CompareLoadMatch is the typed request payload for Compare.LoadTyped.
type CompareLoadMatch struct {
}

// CostGuide is the typed data model for the cost_guide entity.
type CostGuide struct {
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
	Discount *map[string]any `json:"discount,omitempty"`
	HiddenCost *[]any `json:"hidden_cost,omitempty"`
	License map[string]any `json:"license"`
	Link map[string]any `json:"link"`
	Name *string `json:"name,omitempty"`
	Positioning *map[string]any `json:"positioning,omitempty"`
	PriceRange *map[string]any `json:"price_range,omitempty"`
	SchemaVersion *string `json:"schema_version,omitempty"`
	Slug *string `json:"slug,omitempty"`
	Source *string `json:"source,omitempty"`
	Tier *[]any `json:"tier,omitempty"`
	Verdict *string `json:"verdict,omitempty"`
	Verification *map[string]any `json:"verification,omitempty"`
}

// PricingLoadMatch is the typed request payload for Pricing.LoadTyped.
type PricingLoadMatch struct {
	Id *string `json:"id,omitempty"`
}

// Tco is the typed data model for the tco entity.
type Tco struct {
	Billing *string `json:"billing,omitempty"`
	Seat *int `json:"seat,omitempty"`
	Slug string `json:"slug"`
	Tier *string `json:"tier,omitempty"`
}

// TcoCreateData is the typed request payload for Tco.CreateTyped.
type TcoCreateData struct {
	Billing *string `json:"billing,omitempty"`
	Seat *int `json:"seat,omitempty"`
	Slug string `json:"slug"`
	Tier *string `json:"tier,omitempty"`
}

// Usage is the typed data model for the usage entity.
type Usage struct {
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

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
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

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
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
