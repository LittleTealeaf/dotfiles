
vim.cmd([[
	let g:auto_session_pre_save_cmds = ["NeoTreeClose","AerialCloseAll"]
]])

require("auto-session").setup({
	log_level = "error",
	auto_session_supress_dirs = {
		"~/",
		"~/*",
		"~/Downloads",
		"/",
		"~/tmp/*"
	},
})
