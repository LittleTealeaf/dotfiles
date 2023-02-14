local treeclimber = require('tree-climber')
local setkey = vim.keymap.set

local keyopts = {silent = true}

local conf_goto = function(fun)
	return function ()
		fun({
			skip_comments = true,
			highlight = true,
			timeout = 300,
			higroup = 'Search'
		})
	end
end

setkey({'n', 'v', 'o'},'<C-h>',conf_goto(treeclimber.goto_parent), keyopts)
setkey({'n', 'v', 'o'},'<C-l>',conf_goto(treeclimber.goto_child), keyopts)
setkey({'n', 'v', 'o'},'<C-j>',conf_goto(treeclimber.goto_next), keyopts)
setkey({'n', 'v', 'o'},'<C-k>',conf_goto(treeclimber.goto_prev), keyopts)
setkey({'n','o'}, '<C-b>', treeclimber.select_node, keyopts)
setkey({'n'}, '<C-n>', treeclimber.highlight_node, keyopts)
