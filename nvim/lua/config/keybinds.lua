vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { silent = true, desc = "Write File" })
vim.keymap.set("n", "<leader>wa", "<cmd>wa<CR>", { silent = true, desc = "Write All" })

-- Windows
vim.keymap.set('n', '<leader>wq', '<cmd>q<CR>', { silent = true, desc = "Close Window" })
vim.keymap.set('n', '<leader>wx', '<cmd>split<CR>', { silent = true, desc = "Split" })
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { silent = true, desc = "Vertical Split" })
vim.keymap.set('n', '<leader>wo', '<C-W>o', { silent = true, desc = "Close Other Windows" })

vim.keymap.set('n', '<C-w>b', '<cmd>split<CR>', { silent = true, desc = "Split" })
vim.keymap.set('n', '<C-w><C-b>', '<cmd>split<CR>', { silent = true, desc = "Split" })
