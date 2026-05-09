-- 1. Find the project root
local root_dir = vim.fs.root(0, { 'pyproject.toml', 'uv.lock', '.git' })

-- 2. Construct the path to the uv-created python executable
local python_path = root_dir and (root_dir .. '/.venv/bin/python') or 'python'

-- 3. Define and start the LSP
vim.lsp.start({
	name = 'pyright',
	cmd = { 'pyright-langserver', '--stdio' },
	root_dir = root_dir,
	settings = {
		python = {
			-- Tell Pyright which python binary (and thus which packages) to use
			pythonPath = python_path,
		},
	},
	on_attach = function()
		vim.pack.add({
			Github('mfussenegger/nvim-dap-python'),
			Github('mfussenegger/nvim-dap'),
		})
require('dap-python').setup('uv')
	end
})


