import { PricingEntityBase } from '../PricingEntityBase';
import type { PricingSDK } from '../PricingSDK';
import type { Control } from '../types';
import type { Mcp, McpCreateData } from '../PricingTypes';
declare class McpEntity extends PricingEntityBase<Mcp> {
    constructor(client: PricingSDK, entopts: any);
    make(this: McpEntity): McpEntity;
    create(this: any, reqdata?: McpCreateData, ctrl?: Control): Promise<McpEntity>;
}
export { McpEntity };
