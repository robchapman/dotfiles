-- Disable rubocop LSP — ruby-lsp handles RuboCop natively
vim.g.lazyvim_ruby_formatter = "ruby_lsp"

-- Start remote server so Claude Code can open files via nvim --server
-- Socket is scoped to tmux window so adjacent panes share the same server
local tmux_win = vim.fn.system("tmux display-message -p '#{window_id}' 2>/dev/null"):gsub("[%s@]", "")
local sock = tmux_win ~= "" and ("/tmp/nvim-tmux-" .. tmux_win .. ".sock") or vim.fn.tempname()
vim.fn.serverstart(sock)

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
