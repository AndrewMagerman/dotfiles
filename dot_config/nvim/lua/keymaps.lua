-- space bar leader key
vim.g.mapleader = ' '

-- formatting
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = false })
end, { desc = "Format file with LSP" })
