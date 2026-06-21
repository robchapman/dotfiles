return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = {
      "ObsidianNew",
      "ObsidianSearch",
      "ObsidianToday",
      "ObsidianTags",
      "ObsidianBacklinks",
    },
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/Documents/work notes/*.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/Documents/work notes/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      picker = {
        name = "telescope.nvim",
      },

      workspaces = {
        {
          name = "work",
          path = "~/Documents/work notes",
        },
      },

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
      },

      completion = {
        nvim_cmp = false,
        min_chars = 2,
      },

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>oc"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      ui = {
        enable = true,
        checkboxes = {
          [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          ["x"] = { char = "✔", hl_group = "ObsidianDone" },
        },
      },

      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url })
      end,
    },
  },
}
