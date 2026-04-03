-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "matteblack",
  callback = function()
    vim.api.nvim_set_hl(0, "NonText", { fg = "#A3A3A3" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#333333", bg = "#121212" })
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2a4a2a", fg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2a2a4a", fg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4a2a2a", fg = "#777777" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#3a3a6a", fg = "NONE" })
  end,
})

-- Force terminal buffers to use the main background and hide winbar
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter", "BufWinEnter" }, {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.opt_local.winhighlight = "Normal:Normal,NormalFloat:Normal"
      vim.opt_local.winbar = ""
    end
  end,
})
