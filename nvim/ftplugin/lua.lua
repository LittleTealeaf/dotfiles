vim.lsp.start({
	name = "lua_ls",
	cmd = { "lua-language-server" },
})


local dot_files = os.getenv("DOT_FILES")
local cwd = vim.fn.getcwd()


if cwd == dot_files then
	vim.pack.add({
		'https://github.com/folke/lazydev.nvim'
	})
	require('lazydev').setup({})
end
