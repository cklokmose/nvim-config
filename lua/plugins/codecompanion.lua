return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "github/copilot.vim",
      "ravitemer/mcphub.nvim",
    },
    config = function()
      -- Copilot aktiv i alle buffere (inkl. chat)
      vim.g.copilot_filetypes = { ["*"] = true }

      require("codecompanion").setup({
        -- ✅ MCPHub integreres som en EXTENSION (dette er den dokumenterede måde)
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              -- valgfrit, men nyttigt:
              make_vars = true,           -- lav #variables ud fra MCP resources
              make_slash_commands = true, -- lav /commands ud fra MCP prompts
              show_result_in_chat = true, -- vis tool-output i chat-bufferen
            },
          },
        },

        -- ✅ Brug adapter-navn direkte (Copilot er indbygget)
        strategies = {
          chat = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-4.5", -- vælg din copilot-model her
            },
          },
          inline = {
            adapter = {
              name = "copilot",
              model = "gpt-4.1",
            },
          },
          agent = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-4.5",
            },
          },
        },

        -- Behold Tavily som separat tool
        tools = {
          web_search = {
            provider = "tavily",
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

        -- Små UI-ting
        display = {
          chat = {
            show_tools_processing = true,
          },
          border = "rounded",
        },

        -- Slå detaljeret log til mens vi tester
        opts = {
          log_level = "TRACE",
        },
      })
    end,

    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion chat" },
    },
  },
}
