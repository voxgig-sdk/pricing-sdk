package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/pricing-sdk/go"
	"github.com/voxgig-sdk/pricing-sdk/go/core"

	vs "github.com/voxgig-sdk/pricing-sdk/go/utility/struct"
)

func TestHistoryEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.History(nil)
		if ent == nil {
			t.Fatal("expected non-nil HistoryEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := historyBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "history." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set PRICING_TEST_HISTORY_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		historyRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.history", setup.data)))
		var historyRef01Data map[string]any
		if len(historyRef01DataRaw) > 0 {
			historyRef01Data = core.ToMapAny(historyRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = historyRef01Data

		// LOAD
		historyRef01Ent := client.History(nil)
		historyRef01MatchDt0 := map[string]any{
			"id": historyRef01Data["id"],
		}
		historyRef01DataDt0Loaded, err := historyRef01Ent.Load(historyRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		historyRef01DataDt0LoadResult := core.ToMapAny(entityData(historyRef01DataDt0Loaded))
		if historyRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if historyRef01DataDt0LoadResult["id"] != historyRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func historyBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "history", "HistoryTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read history test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse history test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"history01", "history02", "history03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("PRICING_TEST_HISTORY_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"PRICING_TEST_HISTORY_ENTID": idmap,
		"PRICING_TEST_LIVE":      "FALSE",
		"PRICING_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["PRICING_TEST_HISTORY_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["PRICING_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewPricingSDK(core.ToMapAny(mergedOpts))
	}

	live := env["PRICING_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["PRICING_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
