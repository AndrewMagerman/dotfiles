return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    keys = {
        { "<leader>tn", "<cmd>TestNearest<CR>", desc = "Test nearest" },
        { "<leader>tf", "<cmd>TestFile<CR>", desc = "Test file" },
        { "<leader>ts", "<cmd>TestSuite<CR>", desc = "Test suite" },
        { "<leader>tl", "<cmd>TestLast<CR>", desc = "Test last" },
        { "<leader>tv", "<cmd>TestVisit<CR>", desc = "Test visit" },
    },
    init = function()
        vim.g["test#strategy"] = "vimux"
    end,
}
