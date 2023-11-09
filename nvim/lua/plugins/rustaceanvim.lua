local function lspcmd(params)
	return function()
		vim.cmd.RustLsp(params)
	end
end

local function execute_from_toggleterm(command, args, cwd)
	local Terminal = require('toggleterm.terminal').Terminal
	local shell = require('rustaceanvim.shell')

	Terminal:new({
		cmd = shell.make_command_from_args(command, args),
		dir = cwd,
		close_on_exit = false,
		auto_scroll = true,
		on_open = function(t)
			vim.api.nvim_buf_set_keymap(t.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
		end
	}):toggle()
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
							executor = {
								execute_command = execute_from_toggleterm
							},
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
									workspace = {
										symbol = {
											search = {
												kind = 'all_symbols'
											}
										}
									}
								}
							}
						},
					}
				end
	end
}
