package voxgigpricingsdk

import (
	"github.com/voxgig-sdk/pricing-sdk/go/core"
	"github.com/voxgig-sdk/pricing-sdk/go/entity"
	"github.com/voxgig-sdk/pricing-sdk/go/feature"
	_ "github.com/voxgig-sdk/pricing-sdk/go/utility"
)

// Type aliases preserve external API.
type PricingSDK = core.PricingSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type PricingEntity = core.PricingEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type PricingError = core.PricingError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewCompareEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewCompareEntity(client, entopts)
	}
	core.NewCostGuideEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewCostGuideEntity(client, entopts)
	}
	core.NewCoverageEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewCoverageEntity(client, entopts)
	}
	core.NewDiscoverEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewDiscoverEntity(client, entopts)
	}
	core.NewHistoryEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewHistoryEntity(client, entopts)
	}
	core.NewMcpEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewMcpEntity(client, entopts)
	}
	core.NewPricingEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewPricingEntity(client, entopts)
	}
	core.NewTcoEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewTcoEntity(client, entopts)
	}
	core.NewUsageEntityFunc = func(client *core.PricingSDK, entopts map[string]any) core.PricingEntity {
		return entity.NewUsageEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewPricingSDK = core.NewPricingSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewPricingSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *PricingSDK  { return NewPricingSDK(nil) }
func Test() *PricingSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
