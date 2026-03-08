return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
        local clang_format = vim.fn.exepath("clang-format")

        return {
            notify_on_error = true,
            -- format_on_save = { timeout_ms = 1000, lsp_fallback = true },
            formatters = {
                clang_format = {
                    command = clang_format ~= "" and clang_format or "clang-format",
                },
            },
            formatters_by_ft = {
                python = { "ruff_fix", "ruff_format" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                objc = { "clang_format" },
                objcpp = { "clang_format" },
            },
        }
    end,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    async = false,
                    timeout_ms = 2000,
                    lsp_format = "fallback",
                })
            end,
            desc = "Format file (Ruff for python, clang-format for C-family)",
        },
    },
}
