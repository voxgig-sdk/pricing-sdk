import { CompareEntity } from './entity/CompareEntity';
import { CostGuideEntity } from './entity/CostGuideEntity';
import { CoverageEntity } from './entity/CoverageEntity';
import { DiscoverEntity } from './entity/DiscoverEntity';
import { HistoryEntity } from './entity/HistoryEntity';
import { McpEntity } from './entity/McpEntity';
import { PricingEntity } from './entity/PricingEntity';
import { TcoEntity } from './entity/TcoEntity';
import { UsageEntity } from './entity/UsageEntity';
export type * from './PricingTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { PricingEntityBase } from './PricingEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class PricingSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Compare(entopts?: Record<string, any>): CompareEntity;
    CostGuide(entopts?: Record<string, any>): CostGuideEntity;
    Coverage(entopts?: Record<string, any>): CoverageEntity;
    Discover(entopts?: Record<string, any>): DiscoverEntity;
    History(entopts?: Record<string, any>): HistoryEntity;
    Mcp(entopts?: Record<string, any>): McpEntity;
    Pricing(entopts?: Record<string, any>): PricingEntity;
    Tco(entopts?: Record<string, any>): TcoEntity;
    Usage(entopts?: Record<string, any>): UsageEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): PricingSDK;
    tester(testopts?: any, sdkopts?: any): PricingSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof PricingSDK;
export { stdutil, config, BaseFeature, PricingEntityBase, PricingSDK, SDK, };
