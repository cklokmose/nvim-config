
return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      -- VimTeX compiler/viewer opsætning
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_compiler_progname = "nvr"
      vim.g.vimtex_compiler_latexmk_engines = { _ = "-lualatex" }

      -- Alt sker når en .tex-fil åbnes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { buffer = true })
          vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { buffer = true })
          vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>", { buffer = true })
        end,
      })
    end,
  },
}
