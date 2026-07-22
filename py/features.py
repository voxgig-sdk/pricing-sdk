# Pricing SDK feature factory

from feature.base_feature import PricingBaseFeature
from feature.test_feature import PricingTestFeature


def _make_feature(name):
    features = {
        "base": lambda: PricingBaseFeature(),
        "test": lambda: PricingTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
