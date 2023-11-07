Transparent = false
Nightly = vim.version().api_prerelease

if vim.g.neovide then
	require("config.neovide")
end
require('config.options')
require('config.commands')
require('config.keybinds')
require('config.lazy')
