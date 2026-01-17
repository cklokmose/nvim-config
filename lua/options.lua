-- Custom vim options and settings
require "nvchad.options"

-- Custom highlight for white text
vim.api.nvim_set_hl(0, "NormalWhite", { fg = "#ffffff" })

-- Auto command for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "latex", "tex", "codecompanion" },
  callback = function()
    vim.wo.winhighlight = "Normal:NormalWhite,NormalFloat:NormalWhite,NormalNC:NormalWhite"
    vim.api.nvim_set_hl(0, "MarkviewPalette1Fg", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "MarkviewPalette2Fg", { fg = "#ffffff" })
  end,
})

-- Auto command specifically for .txt files (not all text filetypes)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    vim.wo.winhighlight = "Normal:NormalWhite,NormalFloat:NormalWhite,NormalNC:NormalWhite"
  end,
})

-- Auto-reload buffers when files change externally (e.g., from Crush)
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "TermLeave" }, {
  command = "checktime",
})

-- Persist undo history to disk
vim.o.undofile = true


-- Command to toggle autocomplete
local map = vim.keymap.set
local opts = { noremap = true, silent = true}

local cmp_enabled = true
map("n", "<leader>a", function()
  local cmp = require('cmp')
  cmp_enabled = not cmp_enabled
  cmp.setup.buffer({enabled = cmp_enabled})
end, vim.tbl_extend("force", opts, { desc = "Toggle completion"}))

-- Navigate with Alt+hjkl and Alt+arrows
-- Allows holding Alt for navigation in wrapped text

-- Normal mode
vim.keymap.set('n', '<M-h>', 'h', { silent = true, desc = "Move left" })
vim.keymap.set('n', '<M-j>', 'gj', { silent = true, desc = "Move down display line" })
vim.keymap.set('n', '<M-k>', 'gk', { silent = true, desc = "Move up display line" })
vim.keymap.set('n', '<M-l>', 'l', { silent = true, desc = "Move right" })
vim.keymap.set('n', '<M-Left>', 'h', { silent = true, desc = "Move left" })
vim.keymap.set('n', '<M-Down>', 'gj', { silent = true, desc = "Move down display line" })
vim.keymap.set('n', '<M-Up>', 'gk', { silent = true, desc = "Move up display line" })
vim.keymap.set('n', '<M-Right>', 'l', { silent = true, desc = "Move right" })

-- Visual mode
vim.keymap.set('v', '<M-h>', 'h', { silent = true, desc = "Move left" })
vim.keymap.set('v', '<M-j>', 'gj', { silent = true, desc = "Move down display line" })
vim.keymap.set('v', '<M-k>', 'gk', { silent = true, desc = "Move up display line" })
vim.keymap.set('v', '<M-l>', 'l', { silent = true, desc = "Move right" })
vim.keymap.set('v', '<M-Left>', 'h', { silent = true, desc = "Move left" })
vim.keymap.set('v', '<M-Down>', 'gj', { silent = true, desc = "Move down display line" })
vim.keymap.set('v', '<M-Up>', 'gk', { silent = true, desc = "Move up display line" })
vim.keymap.set('v', '<M-Right>', 'l', { silent = true, desc = "Move right" })

-- Insert mode (stay in insert mode while moving)
vim.keymap.set('i', '<M-h>', '<Left>', { silent = true, desc = "Move left" })
vim.keymap.set('i', '<M-j>', '<C-o>gj', { silent = true, desc = "Move down display line" })
vim.keymap.set('i', '<M-k>', '<C-o>gk', { silent = true, desc = "Move up display line" })
vim.keymap.set('i', '<M-l>', '<Right>', { silent = true, desc = "Move right" })
vim.keymap.set('i', '<M-Left>', '<Left>', { silent = true, desc = "Move left" })
vim.keymap.set('i', '<M-Down>', '<C-o>gj', { silent = true, desc = "Move down display line" })
vim.keymap.set('i', '<M-Up>', '<C-o>gk', { silent = true, desc = "Move up display line" })
vim.keymap.set('i', '<M-Right>', '<Right>', { silent = true, desc = "Move right" })

-- Override NvChad's Alt+h terminal mapping after it loads
vim.schedule(function()
  vim.schedule(function()
    -- Delete NvChad's Alt+h terminal toggle
    pcall(vim.keymap.del, 'n', '<A-h>')
    pcall(vim.keymap.del, 't', '<A-h>')
    
    -- Re-apply our navigation mappings
    vim.keymap.set('n', '<M-h>', 'h', { silent = true, desc = "Move left" })
    vim.keymap.set('t', '<M-h>', '<C-\\><C-n>h', { silent = true, desc = "Move left" })
  end)
end)
