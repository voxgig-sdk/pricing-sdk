# Pricing SDK feature factory

from pricing_sdk.feature.base_feature import PricingBaseFeature
from pricing_sdk.feature.ratelimit_feature import PricingRatelimitFeature
from pricing_sdk.feature.retry_feature import PricingRetryFeature
from pricing_sdk.feature.test_feature import PricingTestFeature
from pricing_sdk.feature.timeout_feature import PricingTimeoutFeature


_FEATURES = {
    "base": lambda: PricingBaseFeature(),
    "ratelimit": lambda: PricingRatelimitFeature(),
    "retry": lambda: PricingRetryFeature(),
    "test": lambda: PricingTestFeature(),
    "timeout": lambda: PricingTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
