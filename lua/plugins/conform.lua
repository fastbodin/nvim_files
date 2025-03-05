return {
  "stevearc/conform.nvim",
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader><leader>c",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {},
  config = function(_, opts)
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        bib = { "bibtex-tidy" },
      },
    })
    -- format on save
    --vim.api.nvim_create_autocmd("BufWritePre", {
    --  pattern = "*",
    --  callback = function(args)
    --    require("conform").format({ bufnr = args.buf })
    --  end,
    --})
  end,
}
