
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { PricingSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await PricingSDK.test()
    equal(null !== testsdk, true)
  })

})
