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
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- For more plugins, see: https://github.com/catppuccin/nvim#integrations
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- Load the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
