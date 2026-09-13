return {
  {
    "neovim/nvim-lspconfig",   -- We just need something that loads early
    config = function()
      require "configs.yank_highlight"
    end,
  },
}
