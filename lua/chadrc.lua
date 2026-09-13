-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  -- theme = "onedark",        -- You can change to "gruvbox" later if you want
  theme = "gruvbox",        -- You can change to "gruvbox" later if you want
  transparency = true,      -- ← This enables true transparency
  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },
}


-- Optional: Other useful settings
-- M.nvdash = { load_on_startup = true }

return M
