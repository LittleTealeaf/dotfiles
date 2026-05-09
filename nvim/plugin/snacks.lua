vim.pack.add({
	'https://github.com/folke/snacks.nvim'
})

require("snacks").setup({
	lazygit = { enabled = true },
	rename = { enabled = true },
	input = {
		enabled = true,
		win = {
			relative = "cursor",
			border = TRANSPARENT, -- Ensure TRANSPARENT is defined in your config
			width = 45,
		}
	},
	terminal = {
		enabled = true,
		win = {
			style = "minimal",
			border = "none"
		}
	},
	notifier = {
		enabled = true,
		style = "minimal",
		top_down = false
	},
	picker = {
		enabled = true,
		ui_select = true,
		actions = {
			-- Custom toggle & move actions
			toggle_next = function(picker)
				picker:action("toggle")
				picker:action("list_down")
			end,
			toggle_prev = function(picker)
				picker:action("toggle")
				picker:action("list_up")
			end,
		},
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
					["<A-q>"] = { "close", mode = { "i", "n" } },
					["<Tab>"] = { "list_down", mode = { "i", "n" } },
					["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
					["<C-cr>"] = { "toggle", mode = { "i", "n" } }, -- Replaced select_and_next with toggle
					["<C-Down>"] = { "toggle_next", mode = { "i", "n" } },
					["<C-Up>"] = { "toggle_prev", mode = { "i", "n" } },
					["<C-q>"] = { "qflist", mode = { "i", "n" } },
					["<C-t>"] = { "trouble_open", mode = { "i", "n" } },
					["<C-a>"] = { "select_all", mode = { "i", "n" } },
					["<C-s>"] = { "flash", mode = { "i", "n" } },
				},
			},
		},
		previewers = {
			git = { native = true },
		},
	},
})

local wk = require('which-key')
local Snacks = require('snacks')

wk.add({
	-- Files & Search
	{
		"<leader>ff",
		function() Snacks.picker.files() end,
		desc = "Find Files with Preview",
		icon = ""
	},
	{
		"<leader>fd",
		function() Snacks.picker.files({ layout = "select" }) end,
		desc = "Find Files (No Preview)",
		icon = ""
	},
	{
		"<leader>fg",
		function() Snacks.picker.grep({ layout = "select" }) end,
		desc = "Live Grep",
		icon = "󰪸"
	},
	{
		"<leader>fl",
		function() Snacks.picker.lines({ layout = "select" }) end,
		desc = "Search Buffer",
		icon = "󰱽"
	},

	-- Buffers & History
	{
		"<leader>fb",
		function() Snacks.picker.buffers({ layout = "select" }) end,
		desc = "Buffers",
		icon = "󰾵"
	},
	{
		"<leader>fo",
		function() Snacks.picker.recent({ layout = "select" }) end,
		desc = "Old Files",
		icon = ""
	},

	-- LSP & Commands
	{
		"<leader>fs",
		function() Snacks.picker.lsp_symbols({ layout = "select" }) end,
		desc = "Buffer Symbols",
		icon = ""
	},
	{
		"<leader>fa",
		function() Snacks.picker.lsp_workspace_symbols({ layout = "select" }) end,
		desc = "Workspace Symbols",
		icon = ""
	},
	{
		"<leader>fr",
		function() Snacks.picker.lsp_references({ layout = "select" }) end,
		desc = "LSP References",
		icon = ""
	},
	{
		"<leader>fc",
		function() Snacks.picker.commands({ layout = "bottom" }) end, -- "bottom" acts like Ivy
		desc = "Commands",
		icon = ""
	},
	{
		"<leader>fh",
		function() Snacks.picker.help() end,
		desc = "Help Tags",
		icon = "󰋖"
	},

	-- Lazy git
	{
		"<leader>gl",
		function() Snacks.lazygit() end,
		desc = "Lazy Git",
		icon = ""
	},

	-- Terminal
	{
		"<C-\\>",
		function() Snacks.terminal.toggle() end,
		desc = "Toggle Terminal",
		mode = { "n", "t" },
		icon = ""
	}
})

-- Oil.nvim integration using Snacks.picker
if vim.g.features and vim.g.features.oil then
	local oil = require('oil')

	local function oil_prompt(callback)
		Snacks.picker.files({
			title = "Open Directory",
			cmd = "fd",
			args = { "-td" }, -- Only show directories
			layout = "select",
			actions = {
				confirm = function(picker, item)
					picker:close()
					if item and item.file then
						callback(item.file)
					end
				end,
			},
		})
	end

	wk.add({
		{
			'<leader>fe',
			function()
				if oil.get_current_dir() ~= nil then
					oil_prompt(oil.open)
				else
					oil_prompt(oil.open_float)
				end
			end,
			desc = "Open Directory in Float"
		},
		{
			'<leader>eg',
			function()
				oil_prompt(oil.open)
			end,
			desc = "Open Directory",
		}
	})
end

vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(vim.lsp.status(), "info", {
			id = "lsp_progress",
			title = "LSP Progress",
			opts = function(notif)
				notif.icon = ev.data.params.value.kind == "end" and " "
						or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})
