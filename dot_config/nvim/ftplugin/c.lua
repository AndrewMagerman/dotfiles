--- avoid re-loading if filetype plugin is sourced twice
if vim.b.c_ftplugin_loaded then return end
vim.b.c_ftplugin_loaded = true

-- Insert mode: typing ";;" appends a semicolon at end of the line,
-- executes as a one-shot normal command, then stays in insert mode.
vim.keymap.set("i", ";;", "<C-o>A;", {
  buffer = true,
  silent = true,
  desc = "Insert ; at end of line",
})

-- Abbreviation for '->' in C files
vim.cmd("iabbrev ,, ->")

-- Or a mapping instead:
-- vim.keymap.set("i", "<A-.>", "->", { buffer = true, desc = "Insert ->" })
