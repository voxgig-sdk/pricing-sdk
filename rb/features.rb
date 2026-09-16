# Pricing SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module PricingFeatures
  def self.make_feature(name)
    case name
    when "base"
      PricingBaseFeature.new
    when "ratelimit"
      PricingRatelimitFeature.new
    when "retry"
      PricingRetryFeature.new
    when "test"
      PricingTestFeature.new
    when "timeout"
      PricingTimeoutFeature.new
    else
      PricingBaseFeature.new
    end
  end
end
