# Pricing SDK utility: make_context

from pricing_sdk.core.context import PricingContext


def make_context_util(ctxmap, basectx):
    return PricingContext(ctxmap, basectx)
