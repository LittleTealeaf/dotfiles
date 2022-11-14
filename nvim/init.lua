require("plugins").setup()
require("keymaps").setup()
require("config").setup()
require("commands").setup()

vim.cmd([[
	let g:coc_node_path = '/home/tealeaf/.nvm/versions/node/v18.8.0/bin/node'
]])


