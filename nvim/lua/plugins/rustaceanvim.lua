local function lspcmd(params)
	return function()
		vim.cmd.RustLsp(params)
	end
end

return {
	'mrcjkb/rustaceanvim',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	ft = { 'rust' },
	init = function()
		vim.g.rustaceanvim =
				function()
					return {
						tools = {
							hover_actions = {
								border = {
									{ '' },
									{ '' },
									{ '' },
									{ '' },
									{ '' },
									{ '' },
									{ '' },
									{ '' },
								},
							}
						},
						server = {
							on_attach = function(_, bufnr)
								vim.keymap.set('n', '<leader>clr', lspcmd { 'runnables' }, { buffer = bufnr, desc = "Rust Runnables" })
								vim.keymap.set('n', '<leader>cld', lspcmd { 'debuggables' }, { buffer = bufnr, desc = "Rust Debuggabes" })
								vim.keymap.set('n', '<leader>cle', lspcmd { 'explainError' }, { buffer = bufnr, desc = "Explain Error" })
								vim.keymap.set('n', '<leader>clp', lspcmd { 'parentModule' }, { buffer = bufnr, desc = "Parent Module" })
								vim.keymap.set('n', '<leader>clc', lspcmd { 'flyCheck' }, { buffer = bufnr, desc = "Clippy Check" })
								vim.keymap.set('n', '<leader>clt', lspcmd { 'openCargo' }, { buffer = bufnr, desc = "Open Cargo.toml" })
								vim.keymap.set('v', 'K', lspcmd { 'hover', 'range' }, { buffer = bufnr, desc = "Hover Range" })
								-- vim.keymap.set('n','<leader>cl')
							end,
							settings = {
								['rust-analyzer'] = {

								}
							}
						},
					}
				end
	end
}
