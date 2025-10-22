Transparent = (os.getenv("NVIM_TRANSPARENT") or "1") == "1"
BorderedWindows = (os.getenv("NVIM_BORDERED_WINDOWS") or "0") == "1"
Nightly = vim.version().api_prerelease

vim.g.nightly = vim.version().api_prerelease


local obsidian_dir = os.getenv("OBSIDIAN_DIR")
local obsidian = (obsidian_dir and obsidian_dir ~= "") and true or false

local scrollback = os.getenv('KITTY_SCROLLBACK_NVIM') == 'true'

local lsp = not scrollback
local dap = lsp
local git = not scrollback
local treesitter = true
local oil = not scrollback

vim.g.kitty_scrollback = scrollback

vim.g.features = {
	lsp = lsp,
	dap = dap,
	git = git,
	treesitter = treesitter,
	oil = oil,
	obsidian = obsidian,
}

if vim.g.neovide then
	require("config.neovide")
end

require('config.options')
require('config.commands')
require('config.keybinds')
require('config.lazy')
require('config.kitty')
