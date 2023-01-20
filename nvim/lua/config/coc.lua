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
	'coc-git',
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
--keyset('n','<leader>ca','<Plug>(coc-codeaction)', {silent=true})

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




-- NOTIFICATIONS
local coc_status_record = {}
function coc_status_notify(msg, level)
	local notify_opts = {title = "LSP Status", timeout=500, hide_from_history = true, on_close = reset_coc_status_record}
	if coc_status_record ~= {} then
		notify_opts["replace"] = coc_status_record.id
	end
	coc_status_record = vim.notify(msg,level,notify_opts)
end

function reset_coc_status_record(window)
	coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg,level)
	local notify_opts = {title = "LSP Diagnostics", timeout=500, on_close = reset_coc_diag_record}
	if coc_diag_record ~= {} then
		notify_opts["replace"] = coc_diag_record.id
	end
	coc_diag_record = vim.notify(msg,level,notify_opts)
end

function reset_coc_diag_record(window)
	coc_diag_record = {}
end

vim.cmd([[
function! s:DiagnosticNotify() abort
  let l:info = get(b:, 'coc_diagnostic_info', {})
  if empty(l:info) | return '' | endif
  let l:msgs = []
  let l:level = 'info'
   if get(l:info, 'warning', 0)
    let l:level = 'warn'
  endif
  if get(l:info, 'error', 0)
    let l:level = 'error'
  endif
 
  if get(l:info, 'error', 0)
    call add(l:msgs, ' Errors: ' . l:info['error'])
  endif
  if get(l:info, 'warning', 0)
    call add(l:msgs, ' Warnings: ' . l:info['warning'])
  endif
  if get(l:info, 'information', 0)
    call add(l:msgs, ' Infos: ' . l:info['information'])
  endif
  if get(l:info, 'hint', 0)
    call add(l:msgs, ' Hints: ' . l:info['hint'])
  endif
  let l:msg = join(l:msgs, "\n")
  if empty(l:msg) | let l:msg = ' All OK' | endif
  call v:lua.coc_diag_notify(l:msg, l:level)
endfunction

function! s:StatusNotify() abort
  let l:status = get(g:, 'coc_status', '')
  let l:level = 'info'
  if empty(l:status) | return '' | endif
  call v:lua.coc_status_notify(l:status, l:level)
endfunction

function! s:InitCoc() abort
  execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
endfunction

" notifications
autocmd User CocNvimInit call s:InitCoc()
autocmd User CocDiagnosticChange call s:DiagnosticNotify()
autocmd User CocStatusChange call s:StatusNotify()
]])
