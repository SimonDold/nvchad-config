-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  space = "·",     -- shows dots for normal spaces (can be noisy)
}
