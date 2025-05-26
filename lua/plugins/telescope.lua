-- plugins/telescope.lua:
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    --{ "archie-judd/telescope-words.nvim" },
  },
  config = function()
    require("telescope").setup({})
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]ile" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind via [G]rep" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
    vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "[F]ind [C]ommand" })
    vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "[F]ind [M]anual" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uqckfix" })
    vim.keymap.set("n", "<leader>ft", builtin.spell_suggest, { desc = "[F]ix [T]ypo" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymap" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[F]ind [R]ef." })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "[F]ind [D]ef." })
    vim.keymap.set("n", "<leader>fp", builtin.planets, { desc = "[F]ind [P]lanet" })
    vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "[F]ind [E]rrors" })

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[F]ind [N]eovim files" })

  end,
}
