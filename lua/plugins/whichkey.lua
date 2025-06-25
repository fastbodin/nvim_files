return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  -- Shows a list of your buffer local and global marks when you hit ` or '
  -- Shows a list of your buffer local and global registers when you
  -- hit " in NORMAL mode, or <c-r> in INSERT mode.
  -- When enabled, this plugin hooks into z= and replaces the full-screen
  -- spelling suggestions window by a list of suggestions within WhichKey.
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
