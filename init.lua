vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
})

-- load theme
local defaults_file = vim.g.base46_cache .. "defaults"
local statusline_file = vim.g.base46_cache .. "statusline"

if vim.fn.filereadable(defaults_file) == 1 then
  dofile(defaults_file)
end

if vim.fn.filereadable(statusline_file) == 1 then
  dofile(statusline_file)
end

require "nvchad.options"
require "nvchad.autocmds"

vim.schedule(function()
  require "nvchad.mappings"
end)
