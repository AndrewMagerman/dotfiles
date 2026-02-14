-- space bar leader key
vim.g.mapleader = ' '

-- vim.keymap.set({ 'n', 'v' },
    -- '<leader>f', function()
        -- vim.lsp.buf.format { async = true }
    -- end,
    -- { desc = '[F]ormat buffer' })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line diagnostics" })

vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy file path to clipboard" })
