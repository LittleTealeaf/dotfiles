
local tabline = require("tabline")
local set_key = vim.keymap.set

set_key("n","<A-[>", tabline.buffer_previous, {})
set_key("n","<A-]>", tabline.buffer_next, {})

set_key('n','<A-{>', function()
	vim.cmd('tabprev')
end, {})

set_key('n','<A-}>', function()
	vim.cmd('tabnext')
end, {})
