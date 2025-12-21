-- Minimal clangd config for Neovim 0.11 builtin LSP.
-- Enable with: vim.lsp.enable("clangd")

local M = {}

M.cmd = { "clangd" }  -- use full path if not on $PATH

-- Helps avoid offsetEncoding warnings with some tools
M.capabilities = (function()
  local c = vim.lsp.protocol.make_client_capabilities()
  c.offsetEncoding = { "utf-16" }
  return c
end)()

-- Keep it simple: detect project root
M.root_markers = {"Makefile", "compile_commands.json", ".clangd", ".git" }

M.filetypes = {"c", "cpp", "objc", "objcpp"}

return M
