require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "clangd",      -- C++ (excellent with compile_commands.json)
  "pyright",     -- Python
  "texlab",      -- LaTeX
  "marksman",    -- Markdown
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
--

-- Custom clangd config
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--pch-storage=memory",
    "--j=4",                    -- adjust to your CPU cores
    "--all-scopes-completion",
  },
  init_options = {
    fallbackFlags = { "--std=c++20" },
  },
})

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      rootDirectory = nil,   -- important for multi-file projects
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      },
    },
  },
})
