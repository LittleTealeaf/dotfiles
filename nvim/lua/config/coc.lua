local g = vim.g
local cmd = vim.cmd
local api = vim.api
local create_command = api.nvim_create_user_command
local keyset = vim.keymap.set
local fn = vim.fn
local bo = vim.bo
local o = vim.o


g.coc_global_extensions = {
	'coc-marketplace',
}
g.coc_config_home = "$DOT_FILES/nvim"


create_command("Format","call CocAction('format')",{})
create_command("Fold","call CocAction('fold', <f-args>)", {nargs = '?'})

cmd("autocmd FileType html let b:coc_pairs_disabled = ['<']")


function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or fn.getline('.'):sub(col,col):match('%s') ~= nil
end


local opts = {silent=true, noremap=true, expr=true, replace_keycodes=false}

-- Autocomplete
keyset('i','<TAB>','coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset('i','<S-TAB>','coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', opts)
keyset('i','<cr>','coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',opts)

-- Rename
keyset('n','<leader>cn','<Plug>(coc-rename)', {silent=true})

-- Code Actions

-- Open Outline
keyset('n','<leader>co',':<C-u>CocList outline<cr>', {silent=true, nowait=true})




function _G.show_docs()
	local cw = fn.expand('<cword>')
	if fn.index({'vim','help'}, bo.filetype) >= 0 then
		api.nvim_command('h '..cw)
	elseif api.nvim_eval('coc#rpc#ready()') then
		fn.CocActionAsync('doHover')
	else
		api.nvim_command('!'..o.keywordprg..' '..cw)
	end
end
keyset('n','K','<CMD>lua _G.show_docs()<CR>', {silent=true})

