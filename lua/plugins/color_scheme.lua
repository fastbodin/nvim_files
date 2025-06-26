return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = true,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "github-main-user/lytmode.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("lytmode").setup()
      vim.cmd.colorscheme("lytmode")
    end,
  },
}
