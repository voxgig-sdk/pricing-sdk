import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Pricing, PricingLoadMatch } from '../PricingTypes';
declare class PricingEntity extends PricingEntityBase<Pricing> {
    constructor(client: PricingSDK, entopts: any);
    make(this: PricingEntity): PricingEntity;
    load(this: any, reqmatch?: PricingLoadMatch, ctrl?: Control): Promise<PricingEntity>;
}
export { PricingEntity };
