return {
  "tpope/vim-rails",
  ft = { "ruby", "eruby" },
  keys = {
    { "<leader>ra", "<cmd>A<cr>", desc = "Alternate file (model↔spec)" },
    { "<leader>rm", "<cmd>Emodel<cr>", desc = "Edit model (prompt)" },
    { "<leader>rc", "<cmd>Econtroller<cr>", desc = "Edit controller (prompt)" },
    { "<leader>rv", "<cmd>Eview<cr>", desc = "Edit view (prompt)" },
    { "<leader>rs", "<cmd>Espec<cr>", desc = "Edit spec (prompt)" },
    { "<leader>rj", "<cmd>Ejob<cr>", desc = "Edit job (prompt)" },
    { "<leader>rS", "<cmd>Eserializer<cr>", desc = "Edit serializer (prompt)" },
  },
}
