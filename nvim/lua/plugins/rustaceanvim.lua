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
		-- 'lvimuser/lsp-inlayhints.nvim'
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
						dap = {
							auto_generate_source_map = false
						},
						server = {
							on_attach = function(client, bufnr)
								if client.server_capabilities.inlayHintProvider then
									vim.lsp.inlay_hint(bufnr, true)
								end
								vim.keymap.set('n', '<leader>clu', lspcmd { 'debuggables', 'last' },
									{ buffer = bufnr, desc = "Rust Last Debuggable" })
								vim.keymap.set('n', '<leader>cli', lspcmd { 'runnables', 'last' },
									{ buffer = bufnr, desc = "Rust Last Runnable" })
								vim.keymap.set('n', '<leader>clr', lspcmd { 'runnables' }, { buffer = bufnr, desc = "Rust Runnables" })
								vim.keymap.set('n', '<leader>cld', lspcmd { 'debuggables' }, { buffer = bufnr, desc = "Rust Debuggabes" })
								vim.keymap.set('n', '<leader>cle', lspcmd { 'explainError' }, { buffer = bufnr, desc = "Explain Error" })
								vim.keymap.set('n', '<leader>clp', lspcmd { 'parentModule' }, { buffer = bufnr, desc = "Parent Module" })
								vim.keymap.set('n', '<leader>clc', lspcmd { 'flyCheck' }, { buffer = bufnr, desc = "Clippy Check" })
								vim.keymap.set('n', '<leader>clt', lspcmd { 'openCargo' }, { buffer = bufnr, desc = "Open Cargo.toml" })
								vim.keymap.set('v', 'K', lspcmd { 'hover', 'range' }, { buffer = bufnr, desc = "Hover Range" })
							end,
							settings = function()
								return {
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
							end
						},
					}
				end
	end
}
