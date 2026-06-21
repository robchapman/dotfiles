return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  keys = {
    { "<leader>go", "<cmd>Octo<cr>", desc = "Octo" },
    { "<leader>gpr", "<cmd>Octo pr list<cr>", desc = "List PRs" },
    { "<leader>gpc", "<cmd>Octo pr create<cr>", desc = "Create PR" },
    { "<leader>gis", "<cmd>Octo issue list<cr>", desc = "List issues" },
    { "<leader>gic", "<cmd>Octo issue create<cr>", desc = "Create issue" },
    { "<leader>grv", "<cmd>Octo review start<cr>", desc = "Start review" },
    { "<leader>grs", "<cmd>Octo review submit<cr>", desc = "Submit review" },
  },
  config = function()
    require("octo").setup({
      use_local_fs = false,
      enable_builtin = true,
      default_remote = { "upstream", "origin" },
      ssh_aliases = {},
      picker = "telescope",
      picker_config = {
        use_emojis = true,
      },
      comment_icon = "▎",
      outdated_icon = "󰅒 ",
      resolved_icon = " ",
      reaction_viewer_hint_icon = " ",
      user_icon = " ",
      timeline_marker = " ",
      timeline_indent = "2",
      right_bubble_delimiter = "",
      left_bubble_delimiter = "",
      github_hostname = "",
      file_panel = {
        size = 10,
        use_icons = true,
      },
      mappings = {},
    })
  end,
}
