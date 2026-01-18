return {
  "cklokmose/marbles.nvim",
  lazy = false,
  config = function()
    require("marbles").setup({
      secure_folders = { "~/notes/secure/*" },
    })
    vim.keymap.set("n", "<leader>s", "<cmd>MarblesMenu<cr>")
  end,
}
