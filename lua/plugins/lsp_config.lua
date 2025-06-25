return {
  {
    "neovim/nvim-lspconfig",
    vim.lsp.config("lua_ls", {}),
    vim.lsp.config("pyright", {}),
    vim.lsp.config("clangd", {}),
    vim.lsp.config("ltex_plus", {
      settings = {
        ltex = {
          language = "en-CA",
          dictionary = {
            ["en-CA"] = vim.fn.readfile(
              vim.fn.expand("~/.config/nvim/spell/en.utf-8.add")
            ),
          },
        },
      },
    }),
  },
  {
    "williamboman/mason.nvim",
    enable = true,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enable = true,
    opts = {
      automatic_enable = true,
      ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "ltex_plus",
      },
    },
  },
}
