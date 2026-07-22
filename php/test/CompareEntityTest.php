<?php
declare(strict_types=1);

// Compare entity test

require_once __DIR__ . '/../pricing_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class CompareEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = PricingSDK::test(null, null);
        $ent = $testsdk->Compare(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = compare_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "compare." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set PRICING_TEST_COMPARE_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $compare_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.compare")));
        $compare_ref01_data = null;
        if (count($compare_ref01_data_raw) > 0) {
            $compare_ref01_data = Helpers::to_map($compare_ref01_data_raw[0][1]);
        }

        // LOAD
        $compare_ref01_ent = $client->Compare(null);
        $compare_ref01_match_dt0 = [];
        $compare_ref01_data_dt0_loaded = $compare_ref01_ent->load($compare_ref01_match_dt0, null);
        $this->assertNotNull($compare_ref01_data_dt0_loaded);

    }
}

function compare_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/compare/CompareTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = PricingSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["compare01", "compare02", "compare03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("PRICING_TEST_COMPARE_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "PRICING_TEST_COMPARE_ENTID" => $idmap,
        "PRICING_TEST_LIVE" => "FALSE",
        "PRICING_TEST_EXPLAIN" => "FALSE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["PRICING_TEST_COMPARE_ENTID"]);
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
