---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "onedark" },
  
  hl_override = {
    CursorLineNr = { fg = "lavender" },
    LineNr = { fg = "surface2" },
  },

  changed_themes = {
    catppuccin = {
      base_16 = {
        base05 = "#b4befe", -- lavender
      },
    },
  },
}

M.ui = {
  cmp = {
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "borderless" }, -- borderless / bordered
}

return M
