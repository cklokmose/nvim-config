-- ~/.config/nvim/lua/plugins/telekasten.lua

return {
  {
    "nvim-telekasten/telekasten.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-telekasten/calendar-vim"
    },
    config = function()
      local telekasten = require("telekasten")

      telekasten.setup({
        home = vim.fn.expand("~/notes"),

        auto_set_filetype = false,
        take_over_my_home = false,

        dailies = "dailies",
        weeklies = nil,

        templates = nil,
        image_subdir = nil,

        extension = ".md",
        new_note_filename = "title",
        filename_space_subst = " ",

        follow_creates_nonexisting = true,
        sort = "filename",
      })


    -- Keymaps with descriptions
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>td", telekasten.goto_today,
      vim.tbl_extend("force", opts, { desc = "Telekasten: today" }))

    map("n", "<leader>tn", telekasten.new_note,
      vim.tbl_extend("force", opts, { desc = "Telekasten: new note" }))

    map("n", "<leader>tb", telekasten.show_backlinks,
      vim.tbl_extend("force", opts, { desc = "Telekasten: backlinks" }))

    map("n", "<leader>tf", telekasten.find_notes,
      vim.tbl_extend("force", opts, { desc = "Telekasten: find notes" }))

    map("n", "<leader>tl", telekasten.follow_link,
      vim.tbl_extend("force", opts, { desc = "Telekasten: follow link" }))

    map("n", "<leader>ts", telekasten.search_notes,
      vim.tbl_extend("force", opts, { desc = "Telekasten: search notes"}))

    end,
  },
}
