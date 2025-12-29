-- Custom vim options and settings
require "nvchad.options"

-- Custom highlight for white text
vim.api.nvim_set_hl(0, "NormalWhite", { fg = "#ffffff" })

-- Auto command for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "latex", "tex", "codecompanion" },
  callback = function()
    vim.wo.winhighlight = "Normal:NormalWhite,NormalFloat:NormalWhite,NormalNC:NormalWhite"
  end,
})
