<?php
declare(strict_types=1);

// CostGuide entity test

require_once __DIR__ . '/../pricing_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class CostGuideEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = PricingSDK::test(null, null);
        $ent = $testsdk->CostGuide(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = cost_guide_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "cost_guide." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set PRICING_TEST_COST_GUIDE_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $cost_guide_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.cost_guide")));
        $cost_guide_ref01_data = null;
        if (count($cost_guide_ref01_data_raw) > 0) {
            $cost_guide_ref01_data = Helpers::to_map($cost_guide_ref01_data_raw[0][1]);
        }

        // LOAD
        $cost_guide_ref01_ent = $client->CostGuide(null);
        $cost_guide_ref01_match_dt0 = [
            "id" => $cost_guide_ref01_data["id"],
        ];
        $cost_guide_ref01_data_dt0_loaded = $cost_guide_ref01_ent->load($cost_guide_ref01_match_dt0, null);
        $cost_guide_ref01_data_dt0_load_result = Helpers::to_map(is_object($cost_guide_ref01_data_dt0_loaded) && method_exists($cost_guide_ref01_data_dt0_loaded, 'data_get') ? $cost_guide_ref01_data_dt0_loaded->data_get() : $cost_guide_ref01_data_dt0_loaded);
        $this->assertNotNull($cost_guide_ref01_data_dt0_load_result);
        $this->assertEquals($cost_guide_ref01_data_dt0_load_result["id"], $cost_guide_ref01_data["id"]);

    }
}

function cost_guide_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/cost_guide/CostGuideTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = PricingSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["cost_guide01", "cost_guide02", "cost_guide03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("PRICING_TEST_COST_GUIDE_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "PRICING_TEST_COST_GUIDE_ENTID" => $idmap,
        "PRICING_TEST_LIVE" => "FALSE",
        "PRICING_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["PRICING_TEST_COST_GUIDE_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["PRICING_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
            ],
            $extra ?? [],
        ]);
        $client = new PricingSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["PRICING_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["PRICING_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
