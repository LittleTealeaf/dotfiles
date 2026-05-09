vim.pack.add({
	Github('mfussenegger/nvim-dap'),
})

local dap = require('dap')

dap.adapters.codelldb = {
	type = 'executable',
	command = 'codelldb'
}
