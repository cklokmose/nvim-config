-- Custom vim options and settings
require "nvchad.options"

vim.opt.suffixesadd:append(".md")

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


-- Disable autocomplete for prose filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "latex", "tex", "text", "asciidoc", "rst", "org" },
  callback = function()
    vim.b.cmp_enabled = false
    local cmp = require('cmp')
    cmp.setup.buffer({ enabled = false })
  end,
})

-- Disable line numbers for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false

    vim.keymap.set("n", "gf", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2] + 1
      local target = nil

      local links = {}
      local search_start = 1
      while true do
        local lb, le, _, url = line:find("%[([^%]]*)%]%(([^%)]+)%)", search_start)
        if not lb then break end
        table.insert(links, { lb = lb, le = le, url = url })
        search_start = le + 1
      end

      for _, link in ipairs(links) do
        if col >= link.lb and col <= link.le then
          target = link.url
          break
        end
      end

      if not target and #links == 1 then
        target = links[1].url
      end

      if not target then
        return vim.cmd("normal! gF")
      end

      local decoded = target:gsub("%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
      end)

      local buf_dir = vim.fn.expand("%:p:h")
      local full_path = buf_dir .. "/" .. decoded
      vim.cmd("edit " .. vim.fn.fnameescape(full_path))
    end, { buffer = true, desc = "Follow markdown link" })
  end,
})

-- Also disable for .txt files specifically
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    vim.b.cmp_enabled = false
    local cmp = require('cmp')
    cmp.setup.buffer({ enabled = false })
  end,
})

-- Toggle autocomplete per buffer
local map = vim.keymap.set
local opts = { noremap = true, silent = true}

map("n", "<leader>a", function()
  local cmp = require('cmp')
  -- Initialize buffer variable if it doesn't exist (defaults to enabled)
  if vim.b.cmp_enabled == nil then
    vim.b.cmp_enabled = true
  end
  vim.b.cmp_enabled = not vim.b.cmp_enabled
  cmp.setup.buffer({ enabled = vim.b.cmp_enabled })
  vim.notify("Completion " .. (vim.b.cmp_enabled and "enabled" or "disabled"))
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
