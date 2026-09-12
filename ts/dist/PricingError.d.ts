import { Context } from './Context';
declare class PricingError extends Error {
    isPricingError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { PricingError };
