return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  keys = {
    { "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run file" },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle summary" },
    { "<leader>to", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle output" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
      },
    })
  end,
}
