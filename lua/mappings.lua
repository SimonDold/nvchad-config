require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

map("n", "grr", vim.lsp.buf.incoming_calls, {
  desc = "LSP callers (including calls through virtual base methods)",
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
