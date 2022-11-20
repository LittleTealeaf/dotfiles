local g = vim.g
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn
local bo = vim.bo
local o = vim.o

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
	"coc-snippets",
	"coc-pairs",
	"coc-r-lsp",
}

function _G.show_docs()
  local cw = fn.expand('<cword>')
  if fn.index({'vim', 'help'}, bo.filetype) >= 0 then
      api.nvim_command('h ' .. cw)
  elseif api.nvim_eval('coc#rpc#ready()') then
      fn.CocActionAsync('doHover')
  else
      api.nvim_command('!' .. o.keywordprg .. ' ' .. cw)
  end
end

cmd([[
	let g:coc_config_home = '$DOT_FILES/nvim'
	command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
]])
