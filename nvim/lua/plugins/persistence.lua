local function runIfLoaded(libname, fun)
	local status, library = pcall(require, libname)
	if (status) then
		fun(library)
	end
end

return {
	'folke/persistence.nvim',
	event = 'BufReadPre',
	name = 'persistence',
	opts = {
		pre_save = function()
			runIfLoaded('neotree', function(neotree)
				neotree.close_all()
			end)
		end
	},
	keys = {
		{
			'<leader>ql',
			function()
				require('persistence').load()
			end,
			desc = 'Load last session in this directory'
		},
		{
			'<leader>qs',
			function()
				require('persistence').load({ last = true })
			end,
			desc = 'Load Last Session'
		}
	}
}
