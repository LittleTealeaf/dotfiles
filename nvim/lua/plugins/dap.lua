-- TODO: Add manual DAP adapters if certain plugins are installed for used languages


local function configure_dap_adapters(dap)
end


return {
	{
		'theHamsta/nvim-dap-virtual-text',
		lazy = true,
		dependencies = {
			'nvim-treesitter/nvim-treesitter'
		}
	},
	{
		'rcarriga/nvim-dap-ui',
		lazy = true,
		opts = {
			controls = {
				enabled = true,
				element = 'console'
			},
			floating = {
				border = 'rounded'
			},
			layouts = {
				{
					position = "bottom",
					size = 10,
					elements = {
						{
							id = 'watches',
							size = 0.4
						},
						{
							id = "console",
							size = 0.6
						},
					}
				},
			}
		}
	},
	{
		'mfussenegger/nvim-dap',
		dependencies = { 'williamboman/mason.nvim', 'rcarriga/nvim-dap-ui', 'jay-babu/mason-nvim-dap.nvim', 'theHamsta/nvim-dap-virtual-text', 'rcarriga/cmp-dap', "nvim-neotest/nvim-nio", "folke/which-key.nvim" },
		cond = vim.g.features.dap,
		init = function()
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", linehl = "DapStoppedLine" })
		end,
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')
			local virtual_text = require('nvim-dap-virtual-text')
			local masondap = require('mason-nvim-dap')

			virtual_text.setup({})

			masondap.setup({
				automatic_installation = true,
				ensure_installed = { 'debugpy', 'java-debug-adapter', 'js-debug-adapter', 'delve' },
				handlers = {},
			})

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 8123,
				executable = {
					command = "js-debug-adapter"
				}
			}

			for _, language in ipairs { "javascript", "typescript" } do
				dap.configurations[language] = {
					{
						type = 'pwa-node',
						request = 'launch',
						name = 'Launch file',
						program = '${file}',
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node"
					}
				}
			end

			dap.defaults.fallback.exception_breakpoints = { 'raised', 'uncaught', 'rust_panic' }
			dap.listeners.after.event_initialized['dapui_config'] = dapui.open
			dap.listeners.before.event_terminated['dapui_config'] = dapui.close
			dap.listeners.before.event_exited['dapui_config'] = dapui.close

			-- TODO: https://microsoft.github.io/debug-adapter-protocol/specification#Events


			-- Dap


			require("which-key").add({
				{ "<leader>db", dap.toggle_breakpoint, desc = "Breapoint", icon = "●" },
				{ "<leader>dm", function() dap.toggle_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional Breakpoint", icon = "" },
				{ "<leader>da", dap.continue, desc = "Continue", icon = "" },
				{ "<leader>do", dap.step_out, desc = "Step Out", icon = "" },
				{ "<leader>ds", dap.step_over, desc = "Step Over", icon = "" },
				{ "<leader>di", dap.step_into, desc = "Step Into", icon = "" },
				{ "<leader>du", dap.run_last, desc = "Run Last", icon = "" },
				{
					"<leader>dl",
					function()
						local input = vim.fn.input("Log Point: ")
						if input ~= nil then
							dap.set_breakpoint(nil, nil, input)
						end
					end,
					desc = "Log Point",
					icon = ""
				},
				{ "<leader>dt", dap.terminate, desc = "Terminate", icon = "" },
				{ "<leader>dx", dap.focus_frame, desc = "Focus Frame", icon = "" },
				-- Dap UI
				{ "<leader>dk", function() dapui.eval(nil, { enter = true }) end, desc = "Evaluate Selected", icon = "" },
				{ "<leader>dv", function() dapui.float_element('scopes', { enter = true }) end, desc = "Scopes", icon = "󰫧" },
				{ "<leader>dw", function() dapui.float_element('watches', { enter = true }) end, desc = "Watches", icon = "󰂥" },
				{
					"<leader>de",
					function()
						local input = vim.fn.input("Evaluate: ")
						if input ~= nil then
							dapui.eval(input, { enter = true })
						end
					end,
					desc = "Evaluate",
					icon = "="
				},

				{ "<leader>dr", function() dapui.flaot_element('repl', { enter = true }) end, desc = "repl", icon = "" },
				{ "<leader>dd", dapui.toggle, desc = "Toggle UI", icon = "" },
				{ "<leader>df", function() dapui.float_element('stacks', { enter = true }) end, desc = "Stacks", icon = "" },
				{ "<leader>dj", function() dapui.float_element('breakpoints', { enter = true }) end, desc = "Breakpoints", icon = "" },

			})
		end,
		keys = {
			{ '<leader>da', desc = "Continue" },
			{ '<leader>db', desc = "Breakpoint" },
			{ '<leader>dl', desc = "Log Point" },
			{ '<leader>dm', desc = "Conditional Breakpoint" }
		}
	}
}
