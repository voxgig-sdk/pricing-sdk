import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Discover, DiscoverLoadMatch } from '../PricingTypes';
declare class DiscoverEntity extends PricingEntityBase<Discover> {
    constructor(client: PricingSDK, entopts: any);
    make(this: DiscoverEntity): DiscoverEntity;
    load(this: any, reqmatch?: DiscoverLoadMatch, ctrl?: Control): Promise<DiscoverEntity>;
}
export { DiscoverEntity };
