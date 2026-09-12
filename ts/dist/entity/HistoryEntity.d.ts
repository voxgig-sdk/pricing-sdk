import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { History, HistoryLoadMatch } from '../PricingTypes';
declare class HistoryEntity extends PricingEntityBase<History> {
    constructor(client: PricingSDK, entopts: any);
    make(this: HistoryEntity): HistoryEntity;
    load(this: any, reqmatch?: HistoryLoadMatch, ctrl?: Control): Promise<HistoryEntity>;
}
export { HistoryEntity };
