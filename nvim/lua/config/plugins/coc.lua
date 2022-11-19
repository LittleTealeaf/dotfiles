local g = vim.g
local api = vim.api
local cmd = api.nvim_command
local fn = vim.fn

vim.cmd([[
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
  inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
]])

g.coc_global_extensions = {
	"coc-html",
	"coc-tsserver",
	"coc-emmet",
	"coc-css",
	"coc-clangd",
	"coc-xml",
	"coc-tailwindcss",
	"coc-json",
	"coc-lua",
	"coc-pyright",
	"coc-java",
	"coc-git",
	"coc-sql",
	"coc-sh",
	"coc-yaml",
	"coc-prettier",
}

cmd([[
	let g:coc_config_home = '$DOT_FILES/nvim'
	command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
]])


