return {
  "milanglacier/minuet-ai.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("minuet").setup({
      provider = "openai_compatible",
      throttle = 500,
      debounce = 200,
      notify = "warn",
      context_window = 16000,
      context_ratio = 0.75,
      provider_options = {
        openai_compatible = {
          model = "kimi-k2.6",
          api_key = "OPENCODE_ZEN_API_KEY",
          end_point = "https://opencode.ai/zen/v1/chat/completions",
          name = "OpenCodeZen",
          stream = true,
          optional = {
            reasoning_effort = "none",
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { "*" },
        auto_trigger_ignore_ft = {
          "TelescopePrompt",
          "neo-tree",
          "lazy",
          "mason",
          "help",
          "toggleterm",
          "terminal",
          "snacks_input",
          "snacks_notif",
          "gitcommit",
          "gitrebase",
          "oil",
          "dashboard",
          "alpha",
        },
        keymap = {
          accept = "<A-a>",
          accept_line = "<A-l>",
          next = "<A-]>",
          prev = "<A-[>",
          dismiss = "<A-e>",
        },
        show_on_completion_menu = false,
      },
    })

    local ignore_ft = {
      TelescopePrompt = true, ["neo-tree"] = true, lazy = true, mason = true,
      help = true, toggleterm = true, terminal = true, snacks_input = true,
      snacks_notif = true, gitcommit = true, gitrebase = true, oil = true,
      dashboard = true, alpha = true,
    }

    local function enable_for_buf(buf)
      local ft = vim.bo[buf].filetype
      if ft ~= "" and not ignore_ft[ft] then
        vim.b[buf].minuet_virtual_text_auto_trigger = true
      end
    end

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        enable_for_buf(buf)
      end
    end

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function(ev)
        if vim.b[ev.buf].minuet_virtual_text_auto_trigger == nil then
          enable_for_buf(ev.buf)
        end
      end,
    })
  end,
}
