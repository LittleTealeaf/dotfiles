Transparent = (os.getenv("NVIM_TRANSPARENT") or "1") == "1"
BorderedWindows = (os.getenv("NVIM_BORDERED_WINDOWS") or "0") == "1"
Nightly = vim.version().api_prerelease

require('config.options')
require('config.commands')
require('config.keybinds')


vim.pack.add({
	'https://github.com/nvim-telescope/telescope.nvim',

})


GITHUB_URL = function(name)
	return string.format("https://github.com/%s", name)
end
