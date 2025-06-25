return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>s",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      bib = { "bibtex-tidy" },
    },
    -- formatter customization
    formatters = {
      stylua = {
        prepend_args = { "--column-width", "80" },
      },
      black = {
        prepend_args = { "--line-length", "80" },
      },
      ["clang-format"] = {
        prepend_args = { "--style", "{ColumnLimit: 80}" },
      },
      ["bibtex-tidy"] = {
        prepend_args = { "--max-line-length", "80" },
      },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
