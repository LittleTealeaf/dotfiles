local set_key = vim.keymap.set
local silent = {silent = true}

-- local tabline = require("tabline")
-- local telescope = require("telescope")
-- local telescope_btin = require("telescope.builtin")

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

-- -- Tabline
-- set_key("n","<A-[>", tabline.buffer_previous, {})
-- set_key("n","<A-]>", tabline.buffer_next, {})

set_key('n','<A-{>', function()
	vim.cmd('tabprev')
end, {})

set_key('n','<A-}>', function()
	vim.cmd('tabnext')
end, {})

-- Telescope

-- set_key('n','<leader>ff', telescope_btin.find_files, {})
-- set_key('n','<leader>fg', telescope_btin.live_grep, {})
-- set_key('n','<leader>fb', telescope_btin.buffers, {})
-- set_key('n','<leader>fn', telescope_btin.help_tags, {})
-- set_key('n','<leader>fe', function()
-- 	telescope.extensions.file_browser.file_browser({hidden = true})
-- end, {})
-- set_key('n','<leader>ft', require("telescope-tabs").list_tabs, {})


-- set_key('n','<leader>gi', telescope.extensions.gh.issues, {})
-- set_key('n','<leader>gp', telescope.extensions.gh.pull_request,{})
-- set_key('n','<leader>gg', telescope.extensions.gh.gist, {})
-- set_key('n','<leader>gr', telescope.extensions.gh.run, {})

-- set_key('n','<leader>ba', telescope.extensions.vim_bookmarks.all, {})
-- set_key('n','<leader>bs', telescope.extensions.vim_bookmarks.current_file, {})




---- INSERT MODE

-- coc
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
set_key("i","<TAB>",'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', opts)
set_key("i","<S-TAB>",[[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
set_key("i","<cr>",[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
