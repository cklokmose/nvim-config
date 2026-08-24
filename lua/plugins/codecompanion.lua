return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "github/copilot.vim",
      "ravitemer/codecompanion-history.nvim",
    },
    config = function()
      vim.g.copilot_filetypes = { ["*"] = true }

      require("codecompanion").setup({
        extensions = {
          history = {
            enabled = true,
            opts = {
              picker = "telescope",
              keymap = "gh",
              save_chat_keymap = "sc",
              auto_save = false,
            },
          },
        },

        mcp = {
          servers = {
            context7 = {
              cmd = { "npx", "-y", "@upstash/context7-mcp" },
              env = {
                DEFAULT_MINIMUM_TOKENS = "6000",
              },
            },
            fetch = {
              cmd = { "uvx", "--with", "mcp<2.0", "mcp-server-fetch" },
            },
            filesystem = function()
              return {
                cmd = {
                  "npx",
                  "-y",
                  "@modelcontextprotocol/server-filesystem",
                  vim.uv.cwd(),
                },
              }
            end,
            sequentialthinking = {
              cmd = { "npx", "-y", "@modelcontextprotocol/server-sequential-thinking" },
            },
            time = {
              cmd = { "uvx", "--with", "mcp<2.0", "mcp-server-time" },
            },
          },
          opts = {
            default_servers = { "context7", "sequentialthinking" },
          },
        },

        interactions = {
          chat = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-5",
            },
            tools = {
              web_search = {
                opts = {
                  adapter = "tavily",
                  opts = {
                    topic = "general",
                    search_depth = "advanced",
                    chunks_per_source = 3,
                    max_results = 3,
                    time_range = "month",
                    include_answer = true,
                    include_raw_content = true,
                  },
                },
              },
              opts = {
                default_tools = { "files", "web_search" },
              },
            },
          },
          inline = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-5",
            },
          },
        },

        display = {
          chat = {
            window = {
              border = "rounded",
            },
            floating_window = {
              border = "rounded",
            },
          },
        },

        opts = {
          log_level = "ERROR",
        },
      })
    end,

    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion chat" },
    },
  },
}
