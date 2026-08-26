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

  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },

  statusline = {
    modules = {
      lsp = function()
        for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
          if client.name ~= "copilot" and client.name ~= "GitHub Copilot" then
            return (vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP "
          end
        end
        return ""
      end,
    },
  },
}

return M
