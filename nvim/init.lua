Scrollback = os.getenv('KITTY_SCROLLBACK_NVIM') == 'true'
Transparent = (os.getenv("NVIM_TRANSPARENT") or "1") == "1"
BorderedWindows = (os.getenv("NVIM_BORDERED_WINDOWS") or "0") == "1"
Nightly = vim.version().api_prerelease

Github = function(name)
	return string.format("https://github.com/%s", name)
end


if Scrollback then
	require('scrollback')
else
	require('lsp')
end

require('config.options')
require('config.keybinds')
require('plugins')


