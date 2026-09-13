return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        api.config.mappings.default_on_attach(bufnr)

        -- l = open file or expand folder
        vim.keymap.set("n", "l", api.node.open.edit, 
          { buffer = bufnr, desc = "Open / Expand folder" })

        -- h = collapse folder or go to parent
        vim.keymap.set("n", "h", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.open then
            api.node.open.edit()        -- collapse
          else
            api.node.navigate.parent()  -- go up
          end
        end, { buffer = bufnr, desc = "Collapse or go to parent" })
      end
    end,
  },
}
