return {
  "stevearc/quicker.nvim",
  ft = "qf",
  opts = {
    keys = {
      {
        ">",
        function()
          require("quicker").expand()
        end,
        desc = "Expand quickfix context",
      },
      {
        "<",
        function()
          require("quicker").collapse()
        end,
        desc = "Collapse quickfix context",
      },
    },
  },
  keys = {
    {
      "<leader>q",
      function()
        require("quicker").toggle()
      end,
      desc = "Quickfix",
    },
  },
}
