-- Spell Checker (English + German) - Auto enable
vim.opt.spelllang = { "en_us", "de_de" }

-- Auto-enable for Markdown and LaTeX
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "FileType" }, {
  pattern = { "*.md", "*.markdown", "*.tex", "*.latex", "*.txt" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us", "de_de" }
  end,
})

-- Also enable immediately if we are already in one of those files
if vim.bo.filetype:match("markdown") or vim.bo.filetype:match("tex") then
  vim.opt_local.spell = true
end

-- Safe "Add to Dictionary"
local function safe_spell_add()
  local word = vim.fn.expand("<cword>")

  if word == "" then
    print("No word under cursor")
    return
  end

  vim.ui.input({
    prompt = string.format('Add "%s" to dictionary? Retype it: ', word),
  }, function(input)
    if input == word then
      vim.cmd("silent! spellgood! " .. vim.fn.fnameescape(word))
      print("✅ Added: " .. word)
    else
      print("❌ Not added")
    end
  end)
end

-- remove builtin mapping first
pcall(vim.keymap.del, "n", "zg")

-- override zg
vim.keymap.set("n", "zg", safe_spell_add, {
  noremap = true,
  silent = true,
  desc = "Safe zg",
})
