return {
  "brianhuster/live-preview.nvim",
  event = "VeryLazy",
  enabled = true,
  dependencies = {
    -- You can choose one of the following pickers
    "nvim-telescope/telescope.nvim",
  },
  vim.api.nvim_set_keymap(
    "n",
    "<leader>lp",
    ":LivePreview start<CR>",
    { noremap = true, silent = true, desc = "[L]ive [P]review" }
  ),
}
