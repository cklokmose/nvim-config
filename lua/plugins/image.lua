return {
  "3rd/image.nvim",
  ft = { "markdown", "vimwiki" },  -- Load when opening markdown files
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    backend = "kitty",
    processor = "magick_cli",
    window_overlap_clear_enabled = true, -- auto-hide images when windows overlap
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif" },
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { "markdown", "vimwiki" },
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
  },
}
