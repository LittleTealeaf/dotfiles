vim.pack.add({ Github('mrcjkb/rustaceanvim') })

local function lspcmd(params)
	return function()
		vim.cmd.RustLsp(params)
	end
end

local function execute_command(command, args, cwd)
	local snacks = require('snacks')
	local shell = require('rustaceanvim.shell')
	local cmd = shell.make_command_from_args(command, args)
	snacks.terminal.open(cmd, {
		cwd = cwd,
		auto_close = false,
		win = {
			style = "minimal",
			border = "none",
			position = "top",
			keys = {
				["q"] = { "close", mode = "n", desc = "Close Terminal" }
			}
		},
	})
end


vim.g.rustaceanvim = {
	tools = {
		test_executor_alias = "background",
		executor = {
			execute_command = execute_command
		},
		['hover-actions'] = {
			replace_builtin_hover = true
		},
		hover_actions = {
			border = BorderedWindows and 'rounded' or {
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
		auto_generate_source_map = true
	},
	server = {
		on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			vim.keymap.set('n', '<leader>clu', lspcmd { 'debuggables', bang = true },
				{ buffer = bufnr, desc = "Rust Last Debuggable" })
			vim.keymap.set('n', '<leader>cli', lspcmd { 'runnables', bang = true },
				{ buffer = bufnr, desc = "Rust Last Runnable" })
			vim.keymap.set('n', '<leader>clr', lspcmd { 'runnables' }, { buffer = bufnr, desc = "Rust Runnables" })
			vim.keymap.set('n', '<leader>cla', lspcmd { 'codeAction' }, { buffer = bufnr, desc = "Code Actions" })
			vim.keymap.set('n', '<leader>cld', lspcmd { 'debuggables' }, { buffer = bufnr, desc = "Rust Debuggabes" })
			vim.keymap.set('n', '<leader>cle', lspcmd { 'renderDiagnostic' },
				{ buffer = bufnr, desc = "Render Diagnostic" })
			vim.keymap.set('n', '<leader>clp', lspcmd { 'parentModule' }, { buffer = bufnr, desc = "Parent Module" })
			vim.keymap.set('n', '<leader>clc', lspcmd { 'flyCheck' }, { buffer = bufnr, desc = "Clippy Check" })
			vim.keymap.set('n', '<leader>clt', lspcmd { 'openCargo' }, { buffer = bufnr, desc = "Open Cargo.toml" })
			vim.keymap.set('v', 'K', lspcmd { 'hover', 'range' }, { buffer = bufnr, desc = "Hover Range" })
			vim.keymap.set('n', '<leader>clk', lspcmd { 'moveItem', 'up' }, { buffer = bufnr, desc = "Move Item Up" })
			vim.keymap.set('n', '<leader>clj', lspcmd { 'moveItem', 'down' },
				{ buffer = bufnr, desc = "Move Item Down" })
			vim.keymap.set('n', '<leader>clh', lspcmd { 'joinLines' }, { buffer = bufnr, desc = "Join Lines" })

			hover_cmd = lspcmd { 'hover', 'actions' }
			vim.keymap.set('n', '<leader>ck', function()
				hover_cmd()
				hover_cmd()
			end, { buffer = bufnr, desc = "Hover Actions" })
		end,
		settings = function()
			return {
				['rust-analyzer'] = {
					diagnostics = {
						disabled = { "inactive-code" }
					},
					completion = {
						postfix = {
							enable = true
						}
					},
					check = {
						command = "clippy"
					},
					workspace = {
						symbol = {
							search = {
								kind = 'only_types',
								limit = 1024
							}
						}
					}
				}
			}
		end

	}
}
