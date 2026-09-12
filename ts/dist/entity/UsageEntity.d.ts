import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Usage, UsageLoadMatch } from '../PricingTypes';
declare class UsageEntity extends PricingEntityBase<Usage> {
    constructor(client: PricingSDK, entopts: any);
    make(this: UsageEntity): UsageEntity;
    load(this: any, reqmatch?: UsageLoadMatch, ctrl?: Control): Promise<UsageEntity>;
}
export { UsageEntity };
