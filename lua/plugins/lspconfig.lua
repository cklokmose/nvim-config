-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua
return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "texlab" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      -- keep NvChad's default keymaps, capabilities, on_attach, etc.
      require("nvchad.configs.lspconfig").defaults()

      -- Configure TypeScript/JavaScript language server
      vim.lsp.config("ts_ls", {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
          },
        },
      })
      vim.lsp.enable("ts_ls")

      -- LaTeX language server
      vim.lsp.config("texlab", {})
      vim.lsp.enable("texlab")

      -- Lua language server (configured for Neovim)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}
