local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    cpp = { "clang_format" },
    c = { "clang_format" },
    python = { "black" },
    markdown = { "prettier" },
    latex = { "latexindent" },
  },
  format_on_save = {
    timeout_ms = 800,
    lsp_fallback = true,
  },
}

-- Make clang-format use the project's .clang-format file
require("conform.formatters.clang_format").args = {
  "--style=file",     -- This makes it respect .clang-format in the project root
  "--fallback-style=none",
}
