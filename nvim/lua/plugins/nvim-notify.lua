return {
	'rcarriga/nvim-notify',
	-- config = function()
	-- 	local notify = require('notify')
	--
	-- 	notify.setup({
	-- 		timeout = 500,
	-- 	})
	--
	-- 	-- vim.notify = notify
	-- end
	config = function()
		require('notify').setup({
			timeout = 500,
			background_colour = '#000000',
			stages = 'fade',
			fps = 60,
			render = 'minimal'
		})
	end
}
