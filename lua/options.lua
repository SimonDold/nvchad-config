require "nvchad.options"

-- General display settings
vim.opt.list = true

vim.opt.listchars = {
  space = "·",       -- normal spaces
  tab = "→ ",        -- tabs
  trail = "•",       -- trailing spaces  
  eol = "↲",         -- end of line
  extends = "❯",     -- text continues past right edge
  precedes = "❮",    -- text continues past left edge
  nbsp = "␣",        -- non-breaking spaces
}

-- Highlight trailing whitespace
vim.api.nvim_set_hl(0, "ExtraWhitespace", {
  bg = "#ff0000",
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  callback = function()
    -- avoid adding duplicate matches
    vim.fn.clearmatches()
    vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
  end,
})
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
