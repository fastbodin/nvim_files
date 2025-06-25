return {
  "ggandor/leap.nvim",
  enable = true,
  lazy = false,
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    require("leap").set_default_mappings()
  end,
}
