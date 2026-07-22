# Pricing SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module PricingFeatures
  def self.make_feature(name)
    case name
    when "base"
      PricingBaseFeature.new
    when "test"
      PricingTestFeature.new
    else
      PricingBaseFeature.new
    end
  end
end
