import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Compare, CompareLoadMatch } from '../PricingTypes';
declare class CompareEntity extends PricingEntityBase<Compare> {
    constructor(client: PricingSDK, entopts: any);
    make(this: CompareEntity): CompareEntity;
    load(this: any, reqmatch?: CompareLoadMatch, ctrl?: Control): Promise<CompareEntity>;
}
export { CompareEntity };
