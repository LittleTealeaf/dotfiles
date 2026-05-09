Scrollback = os.getenv('KITTY_SCROLLBACK_NVIM') == 'true'

if Scrollback then
	require('scrollback')
end

Transparent = (os.getenv("NVIM_TRANSPARENT") or "1") == "1"
BorderedWindows = (os.getenv("NVIM_BORDERED_WINDOWS") or "0") == "1"
Nightly = vim.version().api_prerelease

require('config.options')
require('config.keybinds')
require('lsp')


GITHUB_URL = function(name)
	return string.format("https://github.com/%s", name)
end
