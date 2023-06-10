-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true })


vim.keymap.set('n', '<A-[>', '<cmd>bprevious<CR>', { silent = true })
vim.keymap.set('n', '<A-]>', '<cmd>bnext<CR>', { silent = true })


