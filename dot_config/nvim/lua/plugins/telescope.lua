return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      cmd = "Telescope", -- also lazy-loads on the command
      keys = {
        { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = '[S]earch [F]iles' },
         { "<leader>sg", function() require("telescope.builtin").live_grep()  end, desc = '[S]earch by [G]rep'},
         { "<leader>fb", function() require("telescope.builtin").buffers()    end, desc = "Buffers" },
         { "<leader>fh", function() require("telescope.builtin").help_tags()  end, desc = "Help" },
         { "<leader>fo", function() require("telescope.builtin").oldfiles()   end, desc = "Recent files" },
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      --vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      --vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      --vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      --vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      --vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      --vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      --vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
  },


    }