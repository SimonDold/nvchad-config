local cmp = require("cmp")

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },


  -- === nvim-cmp override ===
-- === Strong nvim-cmp override ===
-- === nvim-cmp override (most reliable for v2.5) ===
  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local default = require("nvchad.configs.cmp")   -- Load full NvChad defaults

      local mymappings = {
        -- Enter = act as if no suggestion popup exists (just newline)
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()      -- close the menu without accepting
          end
          fallback()         -- do normal Enter (new line)
        end, { "i" }),
        
        -- Tab = act as if no suggestion popup exists (just spacing)
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()      -- close the menu without accepting
          end
          fallback()         -- do normal Tab (spacing)
        end, { "i" }),

        -- Ctrl+y = accept suggestion
        ["<C-y>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }

      -- Merge mappings
      default.mapping = vim.tbl_deep_extend("force", default.mapping, mymappings)

      require("cmp").setup(default)   -- Explicit setup
    end,
  },
}
