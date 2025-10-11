
-- ~/.config/nvim/lsp/basedpyright.lua
return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git" },
  settings = {
    basedpyright = {
      analysis = { typeCheckingMode = "standard", autoImportCompletions = true },
    },
  },
}


