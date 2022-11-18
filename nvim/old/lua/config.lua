local M = {}

local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

function M.setup()
  opt.smartcase = true
  opt.ignorecase = true
  opt.wrap = true
  opt.mouse = 'a'
  opt.number = true
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = false
  opt.termguicolors = true
  opt.cursorline = true

  g.clipboard = 'unamedplus'

  cmd [[
    set relativenumber number
  ]]

  -- Start NERDTree when vim starts with a directory augment
--  cmd [[
--    autocmd StdinReadPre * let s:std_in=1
--    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
--      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
--  ]]

  -- Automatically set cursor on exit
  cmd [[
    augroup RestoreCursorShapeOnExit
      autocmd!
      autocmd VimLeave * set guicursor=a:ver10
    augroup END
  ]]


  cmd [[
    colorscheme catppuccin
  ]]
end


return M
