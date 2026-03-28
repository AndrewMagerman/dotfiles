return {
    {
        "echasnovski/mini.ai",
        version = false, -- always use latest
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup({
                mappings = {
                    add = "sa",
                    delete = "sd",
                    find = "sf",
                    find_left = "sF",
                    highlight = "sh",
                    replace = "sr",
                    suffix_last = "l",
                    suffix_next = "n",
                },
            })
        end,
    },
}
