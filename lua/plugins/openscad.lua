return {
  "salkin-mada/openscad.nvim",
  ft = "openscad",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    vim.g.openscad_load_snippets = true
    vim.g.openscad_default_mappings = false
    vim.g.openscad_pdf_cmd = "sioyek"
    require("openscad")

    local function openscad_help()
      local plugin = require("lazy.core.config").plugins["openscad.nvim"]
      local help_dir = plugin.dir .. "/help_source/tree"
      require("telescope.builtin").find_files({
        prompt_title = "OpenSCAD Help",
        cwd = help_dir,
        hidden = false,
      })
    end

    vim.api.nvim_create_user_command("OpenscadHelpTelescope", openscad_help, {})

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "openscad",
      callback = function(args)
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
        end
        map("<localleader>c", "<cmd>OpenscadCheatsheet<cr>", "OpenSCAD cheatsheet")
        map("<localleader>h", openscad_help, "OpenSCAD help")
        map("<localleader>m", "<cmd>OpenscadManual<cr>", "OpenSCAD manual (PDF)")
        map("<localleader>o", "<cmd>OpenscadExecFile<cr>", "Open file in OpenSCAD")
      end,
    })
  end,
}
