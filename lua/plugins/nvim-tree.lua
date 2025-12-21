
return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      local api = require("nvim-tree.api")

      -- Disable syncing root with cwd to keep tree root independent
      opts.sync_root_with_cwd = false
      opts.respect_buf_cwd = false
      opts.update_focused_file = opts.update_focused_file or {}
      opts.update_focused_file.enable = true
      opts.update_focused_file.update_root = false

      local original_on_attach = opts.on_attach

      opts.on_attach = function(bufnr)
        -- Always attach nvim-tree defaults (this includes <CR>)
        api.config.mappings.default_on_attach(bufnr)

        -- If NvChad or you already had extra mappings, keep them too
        if original_on_attach then
          original_on_attach(bufnr)
        end

        -- Add your re-root key
        vim.keymap.set("n", ".", api.tree.change_root_to_node, {
          buffer = bufnr,
          desc = "nvim-tree: re-root to node",
          nowait = true,
        })
      end

      return opts
    end,
  },
}
