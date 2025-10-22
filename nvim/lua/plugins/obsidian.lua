local function get_workspaces(base_path)
	if not base_path or base_path == "" then
		return {}
	end

	local directories = {}

	local command = string.format("find %s -type d", base_path)

	local handle = io.popen(command)
	if not handle then
		print("Error: Could not execute find command.")
		return {}
	end

	for path in handle:lines() do
		local name = string.match(path, "([^/]+)/*$")
		table.insert(directories, {
			name = name,
			path = path
		})
	end

	handle:close()
	return directories
end

return {
	"epwalsh/obsidian.nvim",
	enabled = vim.g.features.obsidian,
	dependencies = {
		"nvim-lua/plenary.nvim",
		'hrsh7th/nvim-cmp',
	},
	event = "InsertEnter",
	opts = {
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end
			},
		},
		workspaces = get_workspaces(OBSIDIAN_ENV)
	}
}
