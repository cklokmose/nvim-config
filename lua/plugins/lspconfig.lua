-- ~/.config/nvim/lua/custom/plugins/lspconfig.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- keep NvChad’s default keymaps, capabilities, on_attach, etc.
      require("nvchad.configs.lspconfig").defaults()

      -- new Neovim 0.11+ API
      vim.lsp.config("texlab", {})
      vim.lsp.enable("texlab")
    end,
  },
}
