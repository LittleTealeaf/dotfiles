local set_key = vim.keymap.set

local silent = {silent = true}

---- NORMAL MODE

-- Bookmarks
set_key('n','<leader>bb', '<Plug>BookmarkToggle', silent)
set_key('n','<leader>bt', '<Plug>BookmarkAnnotate', silent)
set_key('n','<leader>ba', '<Plug>BookmarkShowAll', silent)
set_key('n','<leader>bj', '<Plug>BookmarkNext', silent)
set_key('n','<leader>bk', '<Plug>BookmarkPrev', silent)
set_key('n','<leader>bc', '<Plug>BookmarkClear', silent)
set_key('n','<leader>bC', '<Plug>BookmarkClearAll', silent)

-- Coc

set_key("n","K",'<CMD>lua _G.show_docs()<CR>',silent)

set_key("n","<leader>cn", "<Plug>(coc-rename)", silent)
set_key("n","<leader>cd", "<Plug>(coc-definition)", silent)
set_key("n","<leader>ct", "<Plug>(coc-type-defition)", silent)
set_key("n","<leader>ci", "<Plug>(coc-implementation)", silent)
set_key("n","<leader>cr", "<Plug>(coc-references)", silent)
set_key("n","<leader>ca", "<Plug>(coc-codeaction)", silent)

---- INSERT MODE

-- coc
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
set_key("i","<TAB>",'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', opts)
set_key("i","<S-TAB>",[[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
set_key("i","<cr>",[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
