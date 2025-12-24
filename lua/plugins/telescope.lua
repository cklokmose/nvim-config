return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    return require "nvchad.configs.telescope"
  end,
  keys = {
    {
      "<leader>ft",
      "<cmd>Telescope treesitter<CR>",
      desc = "telescope treesitter symbols",
    },
  },
}
