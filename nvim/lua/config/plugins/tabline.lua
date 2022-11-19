local tabline = require('tabline')

tabline.setup({})

-- require('tabline').setup({})

local keybind = vim.keymap.set


keybind('n','<A-[>', tabline.buffer_previous ,{} )
keybind('n','<A-]>',tabline.buffer_next ,{})
