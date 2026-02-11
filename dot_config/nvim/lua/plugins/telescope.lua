return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  keys = {
    {
      "<leader>sf",
      function() require("telescope.builtin").find_files() end,
      desc = '[S]earch [F]iles'
    },
    {
      "<leader>sg",
      function() require("telescope.builtin").live_grep() end,
      desc = '[S]earch by [G]rep'
    },
    {
      "<leader><leader>",
      function() require("telescope.builtin").buffers() end,
      desc = '[ ] Find existing buffers'
    },
    {
      "<leader>sh",
      function() require("telescope.builtin").help_tags() end,
      desc = "[S]earch [H]elp"
    },
    {
      "<leader>so",
      function() require("telescope.builtin").oldfiles() end,
      desc = '[S]earch Recent Files ("." for repeat)'
    },
    {
      "<leader>sk",
      function() require("telescope.builtin").keymaps() end,
      desc = '[S]earch [K]eymaps'
    },
    {
      "<leader>sw",
      function() require("telescope.builtin").grep_string() end,
      desc = '[S]earch current [W]ord'
    },
    {
      "<leader>sd",
      function() require("telescope.builtin").diagnostics() end,
      desc = '[S]earch [D]iagnostics'
    },
    {
      "<leader>sr",
      function() require("telescope.builtin").resume() end,
      desc = '[S]earch [R]esume'
    },
  },

  config = function()
    require('telescope').setup({
      defaults = {
        -- exclude .git and .venv everywhere
        file_ignore_patterns = { "%.git/", "%.venv/" },

        hidden = true,
        follow = true,

        -- make live_grep include hidden + ignored, except our exclusions
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--no-ignore",
          "--glob", "!.git/",
          "--glob", "!.venv/"
        },
      },

      -- make find_files include hidden, include ignored, but exclude .git + .venv
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore",
            "--glob", "!.git/*",
            "--glob", "!.venv/*",
          },
        }
      }
    })
  end
}
