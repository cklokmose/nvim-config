return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "<leader>o", "<cmd>Oil .<cr>", desc = "Oil (working dir)" },
    { "-", "<cmd>Oil<cr>", desc = "Oil (parent dir)" },
  },
}
