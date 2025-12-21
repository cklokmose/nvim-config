
return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      local api = require("nvim-tree.api")

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
