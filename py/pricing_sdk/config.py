# Pricing SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "Pricing",
            "slug": "pricing",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
        "transport": "base",
      },
        },
        "options": {
            "base": "https://comparedge.com",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "compare": {},
                "cost_guide": {},
                "coverage": {},
                "discover": {},
                "history": {},
                "mcp": {},
                "pricing": {},
                "tco": {},
                "usage": {},
            },
        },
        "entity": {
      "compare": {
        "fields": [],
        "name": "compare",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "example": "notion,figma",
                      "kind": "query",
                      "name": "slug",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/compare",
                "parts": [
                  "api",
                  "v2",
                  "compare",
                ],
                "select": {
                  "exist": [
                    "slug",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "cost_guide": {
        "fields": [
          {
            "name": "id",
            "type": "`$STRING`",
          },
        ],
        "name": "cost_guide",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": "kling-ai",
                      "kind": "param",
                      "name": "id",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/cost-guide/{slug}",
                "parts": [
                  "api",
                  "v2",
                  "cost-guide",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "slug": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "coverage": {
        "fields": [],
        "name": "coverage",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "example": "tiers,hiddenCosts,discounts",
                      "kind": "query",
                      "name": "field",
                      "orig": "field",
                      "type": "`$STRING`",
                    },
                    {
                      "example": "notion,figma",
                      "kind": "query",
                      "name": "slug",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/coverage",
                "parts": [
                  "api",
                  "v2",
                  "coverage",
                ],
                "select": {
                  "exist": [
                    "field",
                    "slug",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "discover": {
        "fields": [],
        "name": "discover",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "example": "crm",
                      "kind": "query",
                      "name": "category",
                      "orig": "category",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "has_free_tier",
                      "orig": "has_free_tier",
                      "type": "`$BOOLEAN`",
                    },
                    {
                      "kind": "query",
                      "name": "limit",
                      "orig": "limit",
                      "type": "`$INTEGER`",
                    },
                    {
                      "kind": "query",
                      "name": "max_price",
                      "orig": "max_price",
                      "type": "`$NUMBER`",
                    },
                    {
                      "kind": "query",
                      "name": "q",
                      "orig": "q",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/discover",
                "parts": [
                  "api",
                  "v2",
                  "discover",
                ],
                "select": {
                  "exist": [
                    "category",
                    "has_free_tier",
                    "limit",
                    "max_price",
                    "q",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "history": {
        "fields": [
          {
            "name": "id",
            "type": "`$STRING`",
          },
        ],
        "name": "history",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": "notion",
                      "kind": "param",
                      "name": "id",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/history/{slug}",
                "parts": [
                  "api",
                  "v2",
                  "history",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "slug": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "mcp": {
        "fields": [],
        "name": "mcp",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {},
                "kind": "http",
                "method": "POST",
                "orig": "/api/mcp",
                "parts": [
                  "api",
                  "mcp",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "pricing": {
        "fields": [
          {
            "name": "attribution",
            "req": True,
            "short": "Ready-to-paste Markdown attribution with both links already embedded (brand -> links.home, \"{product} pricing\" -> links.page).",
            "type": "`$STRING`",
          },
          {
            "name": "category",
            "type": "`$STRING`",
          },
          {
            "name": "discounts",
            "short": "Per-tier annual savings + best available.",
            "type": "`$OBJECT`",
          },
          {
            "name": "hiddenCosts",
            "type": "`$ARRAY`",
          },
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "license",
            "req": True,
            "short": "Per-field license: owned = free to cite with attribution; restricted = display only.",
            "type": "`$OBJECT`",
          },
          {
            "name": "links",
            "req": True,
            "short": "Citation links on every record.",
            "type": "`$OBJECT`",
          },
          {
            "name": "name",
            "type": "`$STRING`",
          },
          {
            "name": "positioning",
            "short": "Starting price vs category median/min/max + sample size.",
            "type": "`$OBJECT`",
          },
          {
            "name": "priceRange",
            "type": "`$OBJECT`",
          },
          {
            "name": "schemaVersion",
            "type": "`$STRING`",
          },
          {
            "name": "slug",
            "type": "`$STRING`",
          },
          {
            "name": "source",
            "short": "The vendor URL the price was read from.",
            "type": "`$STRING`",
          },
          {
            "name": "tiers",
            "type": "`$ARRAY`",
          },
          {
            "name": "verdict",
            "type": "`$STRING`",
          },
          {
            "name": "verification",
            "type": "`$OBJECT`",
          },
        ],
        "name": "pricing",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": "notion",
                      "kind": "param",
                      "name": "id",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "query": [
                    {
                      "kind": "query",
                      "name": "depth",
                      "orig": "depth",
                      "type": "`$STRING`",
                    },
                    {
                      "example": "tiers,hiddenCosts,discounts",
                      "kind": "query",
                      "name": "field",
                      "orig": "field",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/pricing/{slug}",
                "parts": [
                  "api",
                  "v2",
                  "pricing",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "slug": "id",
                  },
                },
                "select": {
                  "exist": [
                    "depth",
                    "field",
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "depth",
                      "orig": "depth",
                      "type": "`$STRING`",
                    },
                    {
                      "example": "notion,figma,slack",
                      "kind": "query",
                      "name": "slug",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/pricing",
                "parts": [
                  "api",
                  "v2",
                  "pricing",
                ],
                "select": {
                  "exist": [
                    "depth",
                    "slug",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "tco": {
        "fields": [
          {
            "name": "billing",
            "type": "`$STRING`",
          },
          {
            "name": "seats",
            "type": "`$INTEGER`",
          },
          {
            "name": "slug",
            "req": True,
            "type": "`$STRING`",
          },
          {
            "name": "tier",
            "type": "`$STRING`",
          },
        ],
        "name": "tco",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {},
                "kind": "http",
                "method": "POST",
                "orig": "/api/v2/tco",
                "parts": [
                  "api",
                  "v2",
                  "tco",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "usage": {
        "fields": [
          {
            "name": "id",
            "type": "`$STRING`",
          },
        ],
        "name": "usage",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "example": "openai",
                      "kind": "param",
                      "name": "id",
                      "orig": "slug",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "query": [
                    {
                      "kind": "query",
                      "name": "input_token",
                      "orig": "input_token",
                      "type": "`$INTEGER`",
                    },
                    {
                      "kind": "query",
                      "name": "model",
                      "orig": "model",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "output_token",
                      "orig": "output_token",
                      "type": "`$INTEGER`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/api/v2/usage/{slug}",
                "parts": [
                  "api",
                  "v2",
                  "usage",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "slug": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                    "input_token",
                    "model",
                    "output_token",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
