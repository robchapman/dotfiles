-- Disable rubocop LSP — ruby-lsp handles RuboCop natively
vim.g.lazyvim_ruby_formatter = "ruby_lsp"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
