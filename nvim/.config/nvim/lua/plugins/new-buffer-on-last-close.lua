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

return {}
