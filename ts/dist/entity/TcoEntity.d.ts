import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Tco, TcoCreateData } from '../PricingTypes';
declare class TcoEntity extends PricingEntityBase<Tco> {
    constructor(client: PricingSDK, entopts: any);
    make(this: TcoEntity): TcoEntity;
    create(this: any, reqdata?: TcoCreateData, ctrl?: Control): Promise<TcoEntity>;
}
export { TcoEntity };
