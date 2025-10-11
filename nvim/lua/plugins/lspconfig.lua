-- File: lua/plugins/lsp.lua

-- This table for your custom server settings remains the same.
local LSP_CONFIG = {
	rust_analyzer = {
		settings = {
			['rust-analyzer'] = {
				check = {
					command = "clippy",
				},
			},
		},
	},
	-- Add other custom server configs here
}

-- Your on_attach function remains the same.
local function on_lsp_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
	-- Add your keymaps here, for example:
	-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
end

return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'williamboman/mason.nvim',
		'neovim/nvim-lspconfig',
	},
	event = 'VeryLazy',
	cond = vim.g.features.lsp,
	config = function()
		-- Define the list of servers you want Mason to install.
		local servers = {
			'lua_ls',
			'rust_analyzer',
			'pyright',
			-- Add all other servers you want installed here
		}

		-- Setup mason-lspconfig to install the servers from the list above.
		require('mason-lspconfig').setup({
			ensure_installed = servers,
			-- automatic_enable is true by default, so we don't need to set it.
			-- This is what handles calling vim.lsp.enable() for you.
		})

		-- Get default capabilities from cmp-nvim-lsp.
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- This loop is still necessary to apply your custom settings to each server.
		for _, server_name in ipairs(servers) do
			local user_config = LSP_CONFIG[server_name] or {}

			vim.lsp.config(server_name, {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Call your shared on_attach function
					on_lsp_attach(client, bufnr)
					-- Call any server-specific on_attach functions
					if user_config.on_attach then
						user_config.on_attach(client, bufnr)
					end
				end,
				settings = user_config.settings,
				before_init = user_config.before_init,
			})

			-- The vim.lsp.enable(server_name) call is NO LONGER NEEDED here!
			-- mason-lspconfig handles it automatically.
		end
	end
}
