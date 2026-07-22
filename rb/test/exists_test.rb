# Pricing SDK exists test

require "minitest/autorun"
require_relative "../Pricing_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = PricingSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
