return {
  "nickjvandyke/opencode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {},
  keys = {
    { "<C-a>", "<cmd>lua require('opencode').ask()<cr>", desc = "Ask opencode" },
    { "<C-x>", "<cmd>lua require('opencode').select()<cr>", desc = "Select opencode action" },
    { "<C-.>", "<cmd>lua require('opencode').toggle()<cr>", desc = "Toggle opencode panel" },
  },
}
