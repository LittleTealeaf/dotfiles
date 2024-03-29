vim.g.neovide_refresh_rate = 60
vim.g.neovide_transparency = 1

vim.o.guifont = "JetBrainsMono NFM:h12"


local function change_scale_factor(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end


local scale_delta = 1.1

vim.keymap.set('n', '<C-+>', function() change_scale_factor(scale_delta) end)
vim.keymap.set('n', '<C-_>', function() change_scale_factor(1 / scale_delta) end)
vim.keymap.set('n', '<C-S-BS>', function() vim.g.neovide_scale_factor = 1 end)
vim.keymap.set('n', '<C-S-CR>', function() os.execute("kitty &") end);
