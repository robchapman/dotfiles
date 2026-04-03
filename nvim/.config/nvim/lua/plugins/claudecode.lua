return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  lazy = false,
  config = function(_, opts)
    require("claudecode").setup(opts)
    vim.defer_fn(function()
      vim.cmd("ClaudeCode")
    end, 500)
  end,
  opts = {
    diff_opts = {
      layout = "vertical",
      open_in_new_tab = true,
      keep_terminal_focus = true,
      hide_terminal_in_new_tab = false,
    },
  },
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd<cr>", desc = "Add buffer to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude session" },
  },
}
