vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,terminal,localoptions"
vim.cmd([[
	let g:auto_session_pre_save_cmds = ["NerdTreeClose"]
]])
require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = {
		"~/",
		"~/Downloads/",
		"/",
		"~/tmp/*"
	}
})
