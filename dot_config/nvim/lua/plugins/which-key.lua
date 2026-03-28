return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>s", group = "search" },
      { "<leader>t", group = "test" },
      { "s", group = "surround", mode = { "n", "x" } },
      { "sa", desc = "Add surrounding", mode = { "n", "x" } },
      { "sd", desc = "Delete surrounding", mode = "n" },
      { "sr", desc = "Replace surrounding", mode = "n" },
      { "sf", desc = "Find surrounding right", mode = "n" },
      { "sF", desc = "Find surrounding left", mode = "n" },
      { "sh", desc = "Highlight surrounding", mode = "n" },
      { "sn", desc = "Next surrounding suffix", mode = "n" },
      { "sl", desc = "Last surrounding suffix", mode = "n" },
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
