require("config.lazy")

vim.opt.shiftwidth = 4

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") --execute file
vim.keymap.set("n", "<space>x", ":.lua<CR>") --execute line (normal mode)
vim.keymap.set("v", "<space>x", ":lua<CR>") --execute line (visual mode)

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
