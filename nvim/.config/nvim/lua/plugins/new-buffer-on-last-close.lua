-- Open a new empty buffer when the last listed buffer is closed
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(ev)
    local listed = vim.fn.getbufinfo({ buflisted = 1 })
    local remaining = vim.tbl_filter(function(b)
      return b.bufnr ~= ev.buf
    end, listed)
    if #remaining == 0 then
      vim.schedule(function()
        vim.cmd("enew")
      end)
    end
  end,
})

-- Clean up empty [No Name] buffers when a real file is opened.
-- Only touch buffers not currently shown in any window — deleting a
-- windowed buffer closes the window and causes layout shifts.
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    vim.schedule(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= args.buf
          and vim.api.nvim_buf_is_valid(buf)
          and vim.api.nvim_buf_get_name(buf) == ""
          and not vim.bo[buf].modified
          and vim.bo[buf].buflisted
          and vim.bo[buf].buftype == ""
          and vim.fn.bufwinid(buf) == -1 then
          pcall(vim.api.nvim_buf_delete, buf, {})
        end
      end
    end)
  end,
})

return {}
