return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_b = {
      {
        "branch",
        fmt = function(name)
          if #name > 30 then
            return name:sub(1, 30) .. "…"
          end
          return name
        end,
      },
    }
  end,
}
