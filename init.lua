require("config.lazy")

-- [[ Setting options ]]
-- See `:help vim.opt` and `:help option-list`

vim.opt.number = true -- line number default

vim.opt.showmode = false -- suppress since in status line

vim.opt.signcolumn = "yes" -- allow error column

vim.opt.colorcolumn = "80" -- vertical column

vim.opt.cursorline = true -- highlight line with cursor

vim.opt.scrolloff = 10 -- min # of lines below/above cursor

vim.opt.shiftwidth = 2 -- default shift

vim.g.python3_host_prog = "/Users/aaronslobodin/miniconda3/envs/pynvim/bin/python"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") --execute file
vim.keymap.set("n", "<space>x", ":.lua<CR>") --execute line (normal mode)
vim.keymap.set("v", "<space>x", ":lua<CR>") --execute line (visual mode)

vim.opt.spellfile = vim.fn.expand("~/.config/nvim/spell/en.utf-8.add") --spell file

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.opt.hlsearch = true -- highlight on search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear on <Esc> in Normal

-- restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
    end
  end,
})
