package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewCompareEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewCostGuideEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewCoverageEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewDiscoverEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewHistoryEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewMcpEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewPricingEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewTcoEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

var NewUsageEntityFunc func(client *PricingSDK, entopts map[string]any) PricingEntity

