Transparent = false
Nightly = vim.version().api_prerelease

vim.g.nightly = vim.version().api_prerelease

local kitty_scrollback = os.getenv('KITTY_SCROLLBACK') == 'TRUE'

-- TODO: re-formalize this and make kitty start up as fast as possible

vim.g.features = {
	lsp = not kitty_scrollback,
	cmp = not kitty_scrollback,
	dap = not kitty_scrollback,
	telescope = not kitty_scrollback,
	treesitter = not kitty_scrollback,
	kitty = not kitty_scrollback,
	obsidian = not kitty_scrollback
}


if vim.g.neovide then
	require("config.neovide")
end
require('config.options')
require('config.commands')
require('config.keybinds')
require('config.lazy')
require('config.kitty')
