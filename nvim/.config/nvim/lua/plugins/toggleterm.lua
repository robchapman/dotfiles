return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {
      border = "double",
      winblend = 0,
    },
    padding = 10,
    highlights = {
      FloatBorder = { guifg = "#C9A84C" },
    },
  },
}
