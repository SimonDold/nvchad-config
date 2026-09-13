return {
  {
    "Julian/lean.nvim",
    ft = { "lean" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    init = function()
      vim.g.lean_config = {}
    end,
  },
}
