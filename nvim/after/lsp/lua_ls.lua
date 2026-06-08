---@type vim.lsp.Config
return {
	name = "lua_ls",
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git"
	},
	settings = {
		Lua = {
			hover = {
				enumsLimit = 100,
				previewFields = 100,
			},
			telemetry = { enable = false },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		},
	},
	on_attach = function(_, bufnr)
		local dot_files = os.getenv("DOT_FILES")
		local cwd = vim.fn.getcwd()


		if cwd == dot_files then
			vim.pack.add({
				Github('folke/lazydev.nvim'),
			})
			require('lazydev').setup({})
		end

		vim.keymap.set('n', '<leader>clr', '<cmd>luafile %<CR>', { buf = bufnr })
	end
}
