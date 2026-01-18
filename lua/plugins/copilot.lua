return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    init = function()
      -- Disable Copilot globally by default
      vim.g.copilot_enabled = false
    end,
    keys = {
      {
        "<leader>ct",
        function()
          if vim.fn['copilot#Enabled']() == 1 then
            vim.cmd('Copilot disable')
          else
            vim.cmd('Copilot enable')
          end
        end,
        desc = "Toggle Copilot",
      },
    },
  },
}

