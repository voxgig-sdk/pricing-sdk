import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Coverage, CoverageLoadMatch } from '../PricingTypes';
declare class CoverageEntity extends PricingEntityBase<Coverage> {
    constructor(client: PricingSDK, entopts: any);
    make(this: CoverageEntity): CoverageEntity;
    load(this: any, reqmatch?: CoverageLoadMatch, ctrl?: Control): Promise<CoverageEntity>;
}
export { CoverageEntity };
