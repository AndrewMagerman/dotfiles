return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        notify_on_error = false,
        -- format_on_save = { timeout_ms = 1000, lsp_fallback = true },
        formatters_by_ft = {
            python = { "ruff_fix", "ruff_format" },
        },
    },
    keys = {
        { "<leader>f", function() require("conform").format() end, desc = "Format file (Ruff for python), LSP else" },
    },
}
