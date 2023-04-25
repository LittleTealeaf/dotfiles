-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

map("n", "<leader>ww", "<cmd>w<CR>", { silent = true })
map("n", "<leader>wa", "<cmd>wa<CR>", { silent = true })


map('n', '<A-[>', '<cmd>bprevious<CR>', { silent = true })
map('n', '<A-]>', '<cmd>bnext<CR>', { silent = true })
-- map('n', '<A-S-[>', '<cmd>tabprevious<CR>', { silent = true })
-- map('n', '<A-S-]>', '<cmd>tabnext<CR>', { silent = true })


map('n', '<leader>bd', '<cmd>bd<CR>', { silent = true })
map('n', '<leader>bc', '<cmd>%bd<CR>', { silent = true })
map('n', '<leader>bf', '<cmd>%bd|e#<CR>', { silent = true })


local function format()
	vim.lsp.buf.format({ async = true })
end

map('n', '<leader>cf', format, { silent = true })
map('n', '<leader>cd', vim.lsp.buf.definition, { silent = true })

map('n', '<leader>ce', vim.diagnostic.open_float, { silent = true })
map('n', '[d', vim.diagnostic.goto_prev, { silent = true })
map('n', ']d', vim.diagnostic.goto_next, { silent = true })
