-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close all buffers and open a blank editor, keeping neo-tree and terminal intact
vim.keymap.set("n", "<leader>bq", function()
  -- Find a main editor window (not terminal, not neo-tree, not floating)
  local target_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buftype = vim.bo[buf].buftype
    local filetype = vim.bo[buf].filetype
    local win_config = vim.api.nvim_win_get_config(win)
    local is_floating = win_config.relative and win_config.relative ~= ""
    if not is_floating and buftype ~= "terminal" and buftype ~= "prompt"
      and filetype ~= "neo-tree" and filetype ~= "neo-tree-popup" then
      target_win = win
      break
    end
  end

  -- Open new empty buffer in the target window
  if target_win then
    vim.api.nvim_set_current_win(target_win)
  end
  local new_buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), new_buf)

  -- Delete all other listed buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted and buf ~= new_buf then
      pcall(vim.api.nvim_buf_delete, buf, {})
    end
  end
end, { desc = "Close all buffers" })

-- Exit terminal mode (enter normal mode to move cursor/visual select/copy)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Resize windows with Alt+Shift+Arrow (smart: moves border in arrow direction)
for _, mode in ipairs({ "n", "t" }) do
  vim.keymap.set(mode, "<M-S-Up>", "<cmd>resize +1<cr>", { desc = "Grow height" })
  vim.keymap.set(mode, "<M-S-Down>", "<cmd>resize -1<cr>", { desc = "Shrink height" })
  vim.keymap.set(mode, "<M-S-Left>", "<cmd>vertical resize +1<cr>", { desc = "Grow width" })
  vim.keymap.set(mode, "<M-S-Right>", "<cmd>vertical resize -1<cr>", { desc = "Shrink width" })
end
