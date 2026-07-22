
import { Context } from './Context'


class PricingError extends Error {

  isPricingError = true

  sdk = 'Pricing'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  PricingError
}

