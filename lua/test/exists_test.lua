-- Pricing SDK exists test

local sdk = require("pricing_sdk")

describe("PricingSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
