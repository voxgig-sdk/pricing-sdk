# Pricing entity test

require "minitest/autorun"
require "json"
require_relative "../Pricing_sdk"
require_relative "runner"

class PricingEntityTest < Minitest::Test
  def test_create_instance
    testsdk = PricingSDK.test(nil, nil)
    ent = testsdk.Pricing(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = pricing_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "pricing." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set PRICING_TEST_PRICING_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    pricing_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.pricing")))
    pricing_ref01_data = nil
    if pricing_ref01_data_raw.length > 0
      pricing_ref01_data = Helpers.to_map(pricing_ref01_data_raw[0][1])
    end

    # LOAD
    pricing_ref01_ent = client.Pricing(nil)
    pricing_ref01_match_dt0 = {
      "id" => pricing_ref01_data["id"],
    }
    pricing_ref01_data_dt0_loaded = pricing_ref01_ent.load(pricing_ref01_match_dt0, nil)
    pricing_ref01_data_dt0_load_result = Helpers.to_map(pricing_ref01_data_dt0_loaded.respond_to?(:data_get) ? pricing_ref01_data_dt0_loaded.data_get : pricing_ref01_data_dt0_loaded)
    assert !pricing_ref01_data_dt0_load_result.nil?
    assert_equal pricing_ref01_data_dt0_load_result["id"], pricing_ref01_data["id"]

  end
end

def pricing_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "pricing", "PricingTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = PricingSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["pricing01", "pricing02", "pricing03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["PRICING_TEST_PRICING_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "PRICING_TEST_PRICING_ENTID" => idmap,
    "PRICING_TEST_LIVE" => "FALSE",
    "PRICING_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["PRICING_TEST_PRICING_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["PRICING_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = PricingSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["PRICING_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["PRICING_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
