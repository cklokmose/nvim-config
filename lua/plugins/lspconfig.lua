-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua
return {
  {
    "neovim/nvim-lspconfig",
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
    end,
  },
}
