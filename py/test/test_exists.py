# ProjectName SDK exists test

import pytest
from pricing_sdk import PricingSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = PricingSDK.test(None, None)
        assert testsdk is not None
