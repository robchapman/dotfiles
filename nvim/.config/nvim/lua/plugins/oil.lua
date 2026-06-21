return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = false,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 4,
      max_width = 80,
      max_height = 30,
    },
  },
  keys = {
    { "<leader>o", "<cmd>Oil --float<cr>", desc = "Open Oil (float)" },
    { "<leader>O", "<cmd>Oil<cr>", desc = "Open Oil (buffer)" },
  },
}
