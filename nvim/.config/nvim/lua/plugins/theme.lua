return {
  {
    "tahayvr/matteblack.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "matteblack",
        callback = function()
          -- bg2 (#333333) used as fg on dark backgrounds gives ~1.5:1 contrast.
          -- gray (#5C6370) fixes these UI chrome groups to readable levels.
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5C6370", bg = "#212121" })
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#5C6370" })
          vim.api.nvim_set_hl(0, "NonText", { fg = "#5C6370" })
          vim.api.nvim_set_hl(0, "SignColumn", { fg = "#5C6370", bg = "#121212" })
          vim.api.nvim_set_hl(0, "VertSplit", { fg = "#5C6370" })
          vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#5C6370" })
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "matteblack",
    },
  },
}
