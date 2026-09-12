import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { CostGuide, CostGuideLoadMatch } from '../PricingTypes';
declare class CostGuideEntity extends PricingEntityBase<CostGuide> {
    constructor(client: PricingSDK, entopts: any);
    make(this: CostGuideEntity): CostGuideEntity;
    load(this: any, reqmatch?: CostGuideLoadMatch, ctrl?: Control): Promise<CostGuideEntity>;
}
export { CostGuideEntity };
