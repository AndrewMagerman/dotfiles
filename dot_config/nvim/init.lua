require("keymaps")
require("options")
require("config.lazy")
require("automaps")

vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("marksman")
vim.lsp.enable("ruff")

vim.diagnostic.config(
    {
        virtual_text = { source = true },
        float = { source = "always" },
    }

)
