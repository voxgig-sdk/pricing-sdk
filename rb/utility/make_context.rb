# Pricing SDK utility: make_context
require_relative '../core/context'
module PricingUtilities
  MakeContext = ->(ctxmap, basectx) {
    PricingContext.new(ctxmap, basectx)
  }
end
