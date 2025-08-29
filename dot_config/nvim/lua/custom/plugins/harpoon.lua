return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon' -- Add current file to Harpoon

    harpoon:setup({
      settings = {
        -- persist your list automatically
        save_on_toggle = true,      -- save when opening/closing the UI
        sync_on_ui_close = true,    -- write to disk when UI closes
        -- make lists project-specific (cwd-based)
        key = function()
          return vim.loop.cwd()
        end,
      },
    })

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add file to Harpoon' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>j', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon file 1' })

    vim.keymap.set('n', '<leader>k', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon file 2' })

    vim.keymap.set('n', '<leader>l', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon file 3' })

    vim.keymap.set('n', '<leader>;', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon file 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
    --
    --
  end,
}
