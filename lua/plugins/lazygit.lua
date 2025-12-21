-- nvim v0.8.0

local function open_lazygit_at_git_root()
  local file = vim.fn.expand("%:p")

  if file ~= "" then
    local git_root = vim.fn.systemlist({
      "git",
      "-C", vim.fn.fnamemodify(file, ":h"),
      "rev-parse",
      "--show-toplevel",
    })[1]

    if git_root and git_root ~= "" then
      vim.cmd("tabnew")
      vim.cmd("lcd " .. git_root)
      vim.cmd("LazyGit")
      return
    end
  end

  -- fallback: LazyGit’s own default behaviour
  vim.cmd("LazyGit")
end

return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>lg",
      open_lazygit_at_git_root,
      desc = "LazyGit (nearest git root or default)",
    },
  },
}
