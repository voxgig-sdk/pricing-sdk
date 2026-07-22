# Pricing SDK configuration

module PricingConfig
  def self.make_config
    {
      "main" => {
        "name" => "Pricing",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
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
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "example" => "notion,figma",
                        "kind" => "query",
                        "name" => "slug",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/compare",
                  "parts" => [
                    "api",
                    "v2",
                    "compare",
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
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "cost_guide" => {
          "fields" => [],
          "name" => "cost_guide",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "kling-ai",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/cost-guide/{slug}",
                  "parts" => [
                    "api",
                    "v2",
                    "cost-guide",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
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
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "example" => "tiers,hiddenCosts,discounts",
                        "kind" => "query",
                        "name" => "field",
                        "orig" => "field",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "example" => "notion,figma",
                        "kind" => "query",
                        "name" => "slug",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/coverage",
                  "parts" => [
                    "api",
                    "v2",
                    "coverage",
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
                  "index$" => 0,
                },
              ],
              "key$" => "load",
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
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "example" => "crm",
                        "kind" => "query",
                        "name" => "category",
                        "orig" => "category",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "has_free_tier",
                        "orig" => "has_free_tier",
                        "reqd" => false,
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "max_price",
                        "orig" => "max_price",
                        "reqd" => false,
                        "type" => "`$NUMBER`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "q",
                        "orig" => "q",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/discover",
                  "parts" => [
                    "api",
                    "v2",
                    "discover",
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
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "history" => {
          "fields" => [],
          "name" => "history",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "notion",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/history/{slug}",
                  "parts" => [
                    "api",
                    "v2",
                    "history",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
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
                  "active" => true,
                  "args" => {},
                  "method" => "POST",
                  "orig" => "/api/mcp",
                  "parts" => [
                    "api",
                    "mcp",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "pricing" => {
          "fields" => [
            {
              "active" => true,
              "name" => "attribution",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "category",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "discount",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "hidden_cost",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "license",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "link",
              "req" => true,
              "type" => "`$OBJECT`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "positioning",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "price_range",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "schema_version",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "slug",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 10,
            },
            {
              "active" => true,
              "name" => "source",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 11,
            },
            {
              "active" => true,
              "name" => "tier",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 12,
            },
            {
              "active" => true,
              "name" => "verdict",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 13,
            },
            {
              "active" => true,
              "name" => "verification",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 14,
            },
          ],
          "name" => "pricing",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "notion",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "depth",
                        "orig" => "depth",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "example" => "tiers,hiddenCosts,discounts",
                        "kind" => "query",
                        "name" => "field",
                        "orig" => "field",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/pricing/{slug}",
                  "parts" => [
                    "api",
                    "v2",
                    "pricing",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
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
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "depth",
                        "orig" => "depth",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "example" => "notion,figma,slack",
                        "kind" => "query",
                        "name" => "slug",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/pricing",
                  "parts" => [
                    "api",
                    "v2",
                    "pricing",
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
                  "index$" => 1,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "tco" => {
          "fields" => [
            {
              "active" => true,
              "name" => "billing",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "seat",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "slug",
              "req" => true,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "tier",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
          ],
          "name" => "tco",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "POST",
                  "orig" => "/api/v2/tco",
                  "parts" => [
                    "api",
                    "v2",
                    "tco",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "create",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "usage" => {
          "fields" => [],
          "name" => "usage",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "params" => [
                      {
                        "active" => true,
                        "example" => "openai",
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "slug",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "index$" => 0,
                      },
                    ],
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "input_token",
                        "orig" => "input_token",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "model",
                        "orig" => "model",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "output_token",
                        "orig" => "output_token",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/api/v2/usage/{slug}",
                  "parts" => [
                    "api",
                    "v2",
                    "usage",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
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
                  "index$" => 0,
                },
              ],
              "key$" => "load",
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
