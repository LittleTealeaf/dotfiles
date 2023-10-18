vim.g.neovide_refresh_rate = 60
vim.g.neovide_transparency = 0.5



NEOVIDE = {
	font = {
		size = 14
	}
}


local function updateNeovideFont()
	vim.o.guifont = "FiraCode Nerd Font:h" .. NEOVIDE.font.size
end


updateNeovideFont()

vim.keymap.set("n", "<C-+>", function()
	NEOVIDE.font.size = NEOVIDE.font.size + 1
	updateNeovideFont()
end, { desc = "Increase Font Size" })

vim.keymap.set("n", "<C-_>", function()
	NEOVIDE.font.size = NEOVIDE.font.size - 1
	updateNeovideFont()
end, { desc = "Decrease Font Size" })
