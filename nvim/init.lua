Transparent = false



if vim.g.vscode then

else
	if vim.g.neovide then
		require("config.neovide")
	end
	require('config.options')
	require('config.commands')
	require('config.keybinds')
	require('config.lazy')
end


-- TODO: try out bufferline again?
