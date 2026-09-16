

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { PricingSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('CostGuideEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when PRICING_TEST_LIVE=TRUE.
  afterEach(liveDelay('PRICING_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = PricingSDK.test()
    const ent = testsdk.CostGuide()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.PRICING_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'cost_guide.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"id","req":false,"type":"`$STRING`","index$":0}],"id":{"field":"id","name":"id"},"name":"cost_guide","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"example":"kling-ai","kind":"param","name":"id","orig":"slug","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /api/v2/cost-guide/{slug}","json":"{\"parameters\":[{\"example\":\"kling-ai\",\"in\":\"path\",\"name\":\"slug\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"description\":\"quickAnswer, keyCosts, transparency, discountPrograms, negotiation (tactics, timing, negotiable vs fixed, email generator URL), snapshot, verification, and links.guide to cite\"},\"404\":{\"description\":\"No cost guide published for this product yet\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/api/v2/cost-guide/{slug}","rename":{"param":{"slug":"id"}},"segments":[{"lit":"api"},{"lit":"v2"},{"lit":"cost-guide"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"cost_guide","name__orig":"cost_guide","Name":"CostGuide","name_":"cost_guide","name-":"cost-guide","NAME":"COST_GUIDE","index$":1}, {"active":true,"entity":"cost_guide","key$":"BasicCostGuideFlow","kind":"basic","name":"BasicCostGuideFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"cost_guide_ref01","srcdatavar":"cost_guide_ref01_data","suffix":"_dt0"},"match":{"id":"cost_guide01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-cost_guide_ref01"}}],"index$":0}]}, 'CostGuide')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let cost_guide_ref01_data = Object.values(setup.data.existing.cost_guide)[0] as any

    // LOAD
    const cost_guide_ref01_ent = client.CostGuide()
    const cost_guide_ref01_match_dt0: any = {}
    cost_guide_ref01_match_dt0.id = cost_guide_ref01_data.id
    const cost_guide_ref01_data_dt0 = (await cost_guide_ref01_ent.load(cost_guide_ref01_match_dt0)).data()
    assert(cost_guide_ref01_data_dt0.id === cost_guide_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/cost_guide/CostGuideTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = PricingSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['cost_guide01','cost_guide02','cost_guide03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'PRICING_TEST_COST_GUIDE_ENTID': idmap,
    'PRICING_TEST_LIVE': 'FALSE',
    'PRICING_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['PRICING_TEST_COST_GUIDE_ENTID']

  const live = 'TRUE' === env.PRICING_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['PRICING_TEST_COST_GUIDE_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new PricingSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
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
  }

  return setup
}
  
