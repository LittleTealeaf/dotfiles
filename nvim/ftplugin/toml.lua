-- Native Neovim 0.11+ configuration
vim.lsp.config['taplo'] = {
	cmd = { 'taplo', 'lsp', 'stdio' },
	filetypes = { 'toml' },
	root_markers = { '.git', 'Cargo.toml' },
}
vim.lsp.enable('taplo')
