return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure to load this before all other plugins
    opts = {
      flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        telescope = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- Load the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
