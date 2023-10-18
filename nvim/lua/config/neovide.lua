vim.g.neovide_refresh_rate = 60
vim.g.neovide_transparency = 0.5

vim.o.guifont = "FiraCode Nerd Font:h14"


local function change_scale_factor(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end


local scale_delta = 1.1

vim.keymap.set('n', '<C-+>', function() change_scale_factor(scale_delta) end)
vim.keymap.set('n', '<C-_>', function() change_scale_factor(1 / scale_delta) end)
