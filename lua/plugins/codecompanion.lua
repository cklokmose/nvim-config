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
      vim.g.copilot_filetypes = { ["*"] = true }

      require("codecompanion").setup({
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
        },

        interactions = {
          chat = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-4.5",
            },
          },
          inline = {
            adapter = {
              name = "copilot",
              model = "claude-sonnet-4.5",
            },
          },

        },

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

        display = {
          chat = {
            show_tools_processing = true,
          },
          border = "rounded",
        },

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
