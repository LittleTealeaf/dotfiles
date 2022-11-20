local g = vim.g
local cmd = vim.cmd
local api = vim.api
local create_command = api.nvim_create_user_command
local fn = vim.fn
local keyset = vim.keymap.set
local bo = vim.bo
local o = vim.o


vim.opt.signcolumn = "yes"

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
}

create_command("Format", "call CocAction('format')", {})
create_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i","<TAB>",'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', opts)
keyset("i","<S-TAB>",[[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i","<cr>",[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Documentation
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
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Rename
keyset("n","<leader>cn", "<Plug>(coc-rename)", {silent = true})

-- GOTO Navigation (;cg?)
keyset("n","<leader>cd", "<Plug>(coc-definition)", {silent = true})
keyset("n","<leader>ct", "<Plug>(coc-type-defition)", {silent = true})
keyset("n","<leader>ci", "<Plug>(coc-implementation)", {silent = true})
keyset("n","<leader>cr", "<Plug>(coc-references)", {silent = true})

keyset("n","<leader>ca", "<Plug>(coc-codeaction)", {silent = true})

-- Snippets

keyset("i","<C-l>","<Plug>(coc-snippets-expand)",{silent = true})
keyset("i","<C-j>","<Plug>(coc-snippets-select)", {silent = true})

-- Final Configuration
cmd([[
	let g:coc_config_home = '$DOT_FILES/nvim'
	command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
]])


