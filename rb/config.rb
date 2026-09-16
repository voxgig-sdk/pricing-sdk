# Pricing SDK configuration

module PricingConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Pricing",
        "slug" => "pricing",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://comparedge.com",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "compare" => {},
          "cost_guide" => {},
          "coverage" => {},
          "discover" => {},
          "history" => {},
          "mcp" => {},
          "pricing" => {},
          "tco" => {},
          "usage" => {},
        },
      },
      "entity" => {
        "compare" => {
          "fields" => [],
          "name" => "compare",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => "notion,figma",
                        "kind" => "query",
                        "name" => "slug",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/compare",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "compare",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "slug",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "compare",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "cost_guide" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "cost_guide",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "kling-ai",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/cost-guide/{slug}",
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "cost-guide",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "cost-guide",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "coverage" => {
          "fields" => [],
          "name" => "coverage",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => "tiers,hiddenCosts,discounts",
                        "kind" => "query",
                        "name" => "field",
                        "orig" => "field",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "notion,figma",
                        "kind" => "query",
                        "name" => "slug",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/coverage",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "coverage",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "field",
                      "slug",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "coverage",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "discover" => {
          "fields" => [],
          "name" => "discover",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => "crm",
                        "kind" => "query",
                        "name" => "category",
                        "orig" => "category",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "has_free_tier",
                        "orig" => "has_free_tier",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "max_price",
                        "orig" => "max_price",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "q",
                        "orig" => "q",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/discover",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "discover",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "category",
                      "has_free_tier",
                      "limit",
                      "max_price",
                      "q",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "discover",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "history" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "history",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "notion",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/history/{slug}",
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "history",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "history",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "mcp" => {
          "fields" => [],
          "name" => "mcp",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/api/mcp",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "mcp",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "mcp",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "pricing" => {
          "fields" => [
            {
              "name" => "attribution",
              "req" => true,
              "short" => "Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, \"{product} pricing\" -> links.page).",
              "type" => "`$STRING`",
            },
            {
              "name" => "category",
              "type" => "`$STRING`",
            },
            {
              "name" => "discounts",
              "short" => "Per-tier annual savings + best available.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "hiddenCosts",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "license",
              "req" => true,
              "short" => "Per-field license: owned = free to cite with attribution; restricted = display only.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "links",
              "req" => true,
              "short" => "Citation links on every record.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "positioning",
              "short" => "Starting price vs category median/min/max + sample size.",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "priceRange",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "schemaVersion",
              "type" => "`$STRING`",
            },
            {
              "name" => "slug",
              "type" => "`$STRING`",
            },
            {
              "format" => "uri",
              "name" => "source",
              "short" => "The vendor URL the price was read from.",
              "type" => "`$STRING`",
            },
            {
              "name" => "tiers",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "verdict",
              "type" => "`$STRING`",
            },
            {
              "name" => "verification",
              "type" => "`$OBJECT`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "pricing",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "notion",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "depth",
                        "orig" => "depth",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "tiers,hiddenCosts,discounts",
                        "kind" => "query",
                        "name" => "field",
                        "orig" => "field",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/pricing/{slug}",
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "pricing",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "depth",
                      "field",
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "pricing",
                    "{id}",
                  ],
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "depth",
                        "orig" => "depth",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "notion,figma,slack",
                        "kind" => "query",
                        "name" => "slug",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/pricing",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "pricing",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "depth",
                      "slug",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "pricing",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "tco" => {
          "fields" => [
            {
              "name" => "billing",
              "type" => "`$STRING`",
            },
            {
              "name" => "seats",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "slug",
              "req" => true,
              "type" => "`$STRING`",
            },
            {
              "name" => "tier",
              "type" => "`$STRING`",
            },
          ],
          "name" => "tco",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/api/v2/tco",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "tco",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "tco",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "usage" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "usage",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => "openai",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "input_token",
                        "orig" => "input_token",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "model",
                        "orig" => "model",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "output_token",
                        "orig" => "output_token",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/v2/usage/{slug}",
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "usage",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                      "input_token",
                      "model",
                      "output_token",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "api",
                    "v2",
                    "usage",
                    "{id}",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    PricingFeatures.make_feature(name)
  end
end
