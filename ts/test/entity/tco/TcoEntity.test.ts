

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


describe('TcoEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when PRICING_TEST_LIVE=TRUE.
  afterEach(liveDelay('PRICING_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = PricingSDK.test()
    const ent = testsdk.Tco()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.PRICING_TEST_LIVE
    for (const op of ['create']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'tco.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"billing","req":false,"type":"`$STRING`","index$":0},{"active":true,"name":"seats","req":false,"type":"`$INTEGER`","index$":1},{"active":true,"name":"slug","req":true,"type":"`$STRING`","index$":2},{"active":true,"name":"tier","req":false,"type":"`$STRING`","index$":3}],"name":"tco","op":{"create":{"input":"data","name":"create","points":[{"active":true,"args":{},"contract":{"id":"POST /api/v2/tco","json":"{\"parameters\":[],\"protocol\":\"http\",\"requestBody\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"billing\":{\"enum\":[\"monthly\",\"annual\"],\"type\":\"string\"},\"seats\":{\"type\":\"integer\"},\"slug\":{\"example\":\"notion\",\"type\":\"string\"},\"tier\":{\"type\":\"string\"}},\"required\":[\"slug\"],\"type\":\"object\"}}}},\"responses\":{\"200\":{\"description\":\"subscription (seat- and annual-aware) + hiddenCosts line items + positioning + links\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"POST","orig":"/api/v2/tco","segments":[{"lit":"api"},{"lit":"v2"},{"lit":"tco"}],"select":{},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"create"}},"relations":{"ancestors":[]},"key$":"tco","name__orig":"tco","Name":"Tco","name_":"tco","name-":"tco","NAME":"TCO","index$":7}, {"active":true,"entity":"tco","key$":"BasicTcoFlow","kind":"basic","name":"BasicTcoFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"tco_ref01"},"match":{},"op":"create","spec":[],"valid":[],"index$":0}]}, 'Tco')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select


    // CREATE
    const tco_ref01_ent = client.Tco()
    let tco_ref01_data = setup.data.new.tco['tco_ref01']

    tco_ref01_data = (await tco_ref01_ent.create(tco_ref01_data)).data()
    assert(null != tco_ref01_data)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/tco/TcoTestData.json')

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
    ['tco01','tco02','tco03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'PRICING_TEST_TCO_ENTID': idmap,
    'PRICING_TEST_LIVE': 'FALSE',
    'PRICING_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['PRICING_TEST_TCO_ENTID']

  const live = 'TRUE' === env.PRICING_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['PRICING_TEST_TCO_ENTID']
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
  
