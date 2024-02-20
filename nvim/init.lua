Transparent = false
Nightly = vim.version().api_prerelease

vim.g.nightly = vim.version().api_prerelease


local scrollback = os.getenv('KITTY_SCROLLBACK') == 'TRUE'

local lsp = not scrollback
local dap = lsp
local git = not scrollback
local treesitter = true
local oil = not scrollback

vim.g.scrollback = scrollback

vim.g.features = {
	lsp = lsp,
	dap = dap,
	git = git,
	treesitter = treesitter,
	oil = oil,
}

if vim.g.neovide then
	require("config.neovide")
end
require('config.options')
require('config.commands')
require('config.keybinds')
require('config.lazy')
require('config.kitty')
