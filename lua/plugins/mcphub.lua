return {
  "ravitemer/mcphub.nvim",
  build = "bundled_build.lua",
  lazy = true,
  cmd = { "MCPHub", "MCPServers", "MCPTools" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("mcphub").setup({
      use_bundled_binary = true,
      
      ui = {
        window = {
          border = "rounded",
          width = 0.8,
          height = 0.8,
        },
      },

      log = {
        level = vim.log.levels.WARN,
      },
    })
  end,
}
