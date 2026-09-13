return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"

      -- Quick header <-> source switch
      vim.keymap.set("n", "<leader>cs", "<cmd>LspClangdSwitchSourceHeader<CR>",
        { desc = "Switch .h <-> .cc", silent = false })

      -- Smart Go to Implementation (gj)
      local function go_to_implementation_smart()
        -- 1. Switch to .cc file (force clangd to load it)
        vim.cmd("LspClangdSwitchSourceHeader")

        -- 2. Wait a bit for the file to load and clangd to parse it
        vim.defer_fn(function()
          -- 3. Switch back to the original .h file
          vim.cmd("LspClangdSwitchSourceHeader")

          -- 4. Small final delay before jumping
          vim.defer_fn(function()
            vim.lsp.buf.definition()
          end, 1600)
        end, 100)   -- ← delay between the two switches (in milliseconds)
      end

      vim.keymap.set("n", "gj", go_to_implementation_smart,
        { desc = "Smart Go to Implementation (.h → .cc)", silent = true })
    end,
  },
}
