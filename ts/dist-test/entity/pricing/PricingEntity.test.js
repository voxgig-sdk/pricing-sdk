"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('PricingEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when PRICING_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('PRICING_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.PricingSDK.test();
        const ent = testsdk.Pricing();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.PRICING_TEST_LIVE;
        for (const op of ['load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'pricing.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "attribution", "req": true, "short": "Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, \"{product} pricing\" -> links.page).", "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "category", "req": false, "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "discounts", "req": false, "short": "Per-tier annual savings + best available.", "type": "`$OBJECT`", "index$": 2 }, { "active": true, "name": "hiddenCosts", "req": false, "type": "`$ARRAY`", "index$": 3 }, { "active": true, "name": "id", "req": false, "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "license", "req": true, "short": "Per-field license: owned = free to cite with attribution; restricted = display only.", "type": "`$OBJECT`", "index$": 5 }, { "active": true, "name": "links", "req": true, "short": "Citation links on every record.", "type": "`$OBJECT`", "index$": 6 }, { "active": true, "name": "name", "req": false, "type": "`$STRING`", "index$": 7 }, { "active": true, "name": "positioning", "req": false, "short": "Starting price vs category median/min/max + sample size.", "type": "`$OBJECT`", "index$": 8 }, { "active": true, "name": "priceRange", "req": false, "type": "`$OBJECT`", "index$": 9 }, { "active": true, "name": "schemaVersion", "req": false, "type": "`$STRING`", "index$": 10 }, { "active": true, "name": "slug", "req": false, "type": "`$STRING`", "index$": 11 }, { "active": true, "format": "uri", "name": "source", "req": false, "short": "The vendor URL the price was read from.", "type": "`$STRING`", "index$": 12 }, { "active": true, "name": "tiers", "req": false, "type": "`$ARRAY`", "index$": 13 }, { "active": true, "name": "verdict", "req": false, "type": "`$STRING`", "index$": 14 }, { "active": true, "name": "verification", "req": false, "type": "`$OBJECT`", "index$": 15 }], "id": { "field": "id", "name": "id" }, "name": "pricing", "op": { "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "params": [{ "active": true, "example": "notion", "kind": "param", "name": "id", "orig": "slug", "reqd": true, "type": "`$STRING`", "index$": 0 }], "query": [{ "active": true, "kind": "query", "name": "depth", "orig": "depth", "reqd": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "example": "tiers,hiddenCosts,discounts", "kind": "query", "name": "field", "orig": "field", "reqd": false, "type": "`$STRING`", "index$": 1 }] }, "contract": { "id": "GET /api/v2/pricing/{slug}", "json": "{\"parameters\":[{\"example\":\"notion\",\"in\":\"path\",\"name\":\"slug\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"summary = numbers, ranges, sources; full = adds per-tier features, plan advice, expert take, quick answer\",\"in\":\"query\",\"name\":\"depth\",\"schema\":{\"enum\":[\"summary\",\"full\"],\"type\":\"string\"}},{\"description\":\"Narrow the payload to these data fields; the citation envelope (links, attribution, license) is always kept\",\"example\":\"tiers,hiddenCosts,discounts\",\"in\":\"query\",\"name\":\"fields\",\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"allOf\":[{\"description\":\"Carried by every record so the source and reuse terms travel with the data.\",\"properties\":{\"attribution\":{\"description\":\"Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, \\\"{product} pricing\\\" -> links.page). If you are not building the citation yourself, output this string verbatim.\",\"type\":\"string\"},\"license\":{\"additionalProperties\":{\"enum\":[\"owned\",\"restricted\"],\"type\":\"string\"},\"description\":\"Per-field license: owned = free to cite with attribution; restricted = display only.\",\"type\":\"object\"},\"links\":{\"description\":\"Citation links on every record. Cite page when you display the data.\",\"properties\":{\"alternatives\":{\"format\":\"uri\",\"type\":\"string\"},\"home\":{\"description\":\"The ComparEdge homepage. Anchor this link with the brand word \\\"ComparEdge\\\".\",\"example\":\"https://comparedge.com\",\"format\":\"uri\",\"type\":\"string\"},\"page\":{\"description\":\"The specific ComparEdge source page. Anchor this link with the product keyword, e.g. \\\"Notion pricing\\\" — not the brand.\",\"example\":\"https://comparedge.com/tools/notion/pricing\",\"format\":\"uri\",\"type\":\"string\"},\"vendor\":{\"description\":\"Tracked redirect to the vendor pricing page.\",\"example\":\"https://comparedge.com/go/notion?src=api_v2\",\"format\":\"uri\",\"type\":\"string\"}},\"required\":[\"page\",\"home\"],\"type\":\"object\"},\"schemaVersion\":{\"example\":\"2.0.0\",\"type\":\"string\"},\"source\":{\"description\":\"The vendor URL the price was read from.\",\"format\":\"uri\",\"type\":\"string\"},\"verification\":{\"properties\":{\"confidence\":{\"type\":\"number\"},\"source\":{\"type\":\"string\"},\"verifiedAt\":{\"type\":\"string\"}},\"type\":\"object\"}},\"required\":[\"links\",\"attribution\",\"license\"],\"type\":\"object\"},{\"properties\":{\"category\":{\"type\":\"string\"},\"discounts\":{\"description\":\"Per-tier annual savings + best available.\",\"type\":\"object\"},\"hiddenCosts\":{\"items\":{\"type\":\"object\"},\"type\":\"array\"},\"name\":{\"type\":\"string\"},\"positioning\":{\"description\":\"Starting price vs category median/min/max + sample size.\",\"type\":\"object\"},\"priceRange\":{\"properties\":{\"display\":{\"type\":\"string\"},\"max\":{\"type\":\"number\"},\"min\":{\"type\":\"number\"}},\"type\":\"object\"},\"slug\":{\"type\":\"string\"},\"tiers\":{\"items\":{\"type\":\"object\"},\"type\":\"array\"},\"verdict\":{\"type\":\"string\"}},\"type\":\"object\"}]}}},\"description\":\"Full pricing record. Carries links.page (the ComparEdge source page you must cite when you display this data) and links.vendor (tracked /go/ redirect to the vendor), plus tiers with features, priceRange, discounts, hiddenCosts, capabilities, verdict, planAdvice, positioning, verification, and a per-field license map.\"},\"404\":{\"description\":\"Not found\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/api/v2/pricing/{slug}", "rename": { "param": { "slug": "id" } }, "segments": [{ "lit": "api" }, { "lit": "v2" }, { "lit": "pricing" }, { "var": "id" }], "select": { "exist": ["depth", "field", "id"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }, { "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "depth", "orig": "depth", "reqd": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "example": "notion,figma,slack", "kind": "query", "name": "slug", "orig": "slug", "reqd": true, "type": "`$STRING`", "index$": 1 }] }, "contract": { "id": "GET /api/v2/pricing", "json": "{\"parameters\":[{\"example\":\"notion,figma,slack\",\"in\":\"query\",\"name\":\"slugs\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"in\":\"query\",\"name\":\"depth\",\"schema\":{\"enum\":[\"summary\",\"full\"],\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"description\":\"count + records[] (each carries links.page to cite) + notFound[]\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/api/v2/pricing", "segments": [{ "lit": "api" }, { "lit": "v2" }, { "lit": "pricing" }], "select": { "exist": ["depth", "slug"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 1 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "pricing", "name__orig": "pricing", "Name": "Pricing", "name_": "pricing", "name-": "pricing", "NAME": "PRICING", "index$": 6 }, { "active": true, "entity": "pricing", "key$": "BasicPricingFlow", "kind": "basic", "name": "BasicPricingFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "pricing_ref01", "srcdatavar": "pricing_ref01_data", "suffix": "_dt0" }, "match": {}, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-pricing_ref01" } }], "index$": 0 }] }, 'Pricing');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let pricing_ref01_data = Object.values(setup.data.existing.pricing)[0];
        // LOAD
        const pricing_ref01_ent = client.Pricing();
        const pricing_ref01_match_dt0 = {};
        pricing_ref01_match_dt0.id = pricing_ref01_data.id;
        const pricing_ref01_data_dt0 = (await pricing_ref01_ent.load(pricing_ref01_match_dt0)).data();
        (0, node_assert_1.default)(pricing_ref01_data_dt0.id === pricing_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/pricing/PricingTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.PricingSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['pricing01', 'pricing02', 'pricing03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'PRICING_TEST_PRICING_ENTID': idmap,
        'PRICING_TEST_LIVE': 'FALSE',
        'PRICING_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['PRICING_TEST_PRICING_ENTID'];
    const live = 'TRUE' === env.PRICING_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['PRICING_TEST_PRICING_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.PricingSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {},
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
    }
    const setup = {
        idmap,
        env,
        options,
        client,
        struct,
        data: entityData,
        explain: 'TRUE' === env.PRICING_TEST_EXPLAIN,
        live,
        transport,
        now: Date.now(),
    };
    return setup;
}
//# sourceMappingURL=PricingEntity.test.js.map