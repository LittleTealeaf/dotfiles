local snacks = require('snacks')
local oil = require('oil')

snacks.setup({
	lazygit = { enabled = true },
	rename = { enabled = true },
	input = {
		enabled = true,
		win = {
			relative = "cursor",
			border = Transparent,
			width = 45,
		}
	},
	terminal = {
		enabled = true,
		win = {
			style = "minimal",
			border = "none",
			keys = {
				term_normal = {
					'<esc>',
					'<C-\\><C-n>',
					mode = 't',
					desc = "Escape to normal mode",
				}
			},
		}
	},
	notifier = {
		enabled = true,
		style = "minimal",
		top_down = false,
		margin = { bottom = 1 }
	},
	picker = {
		layout = "select",
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


-- Files & Search
vim.keymap.set("n", "<leader>ff", function() snacks.picker.smart() end, { desc = "Smart" })
vim.keymap.set("n", "<leader>fd", function() snacks.picker.files() end,
	{ desc = "Find Files (No Preview)" })
vim.keymap.set("n", "<leader>fg", function() snacks.picker.grep() end, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fl", function() snacks.picker.lines() end, { desc = "Search Buffer" })

-- Buffers & History
vim.keymap.set("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fo", function() snacks.picker.recent() end, { desc = "Old Files" })

-- LSP & Commands
vim.keymap.set("n", "<leader>fs", function() snacks.picker.lsp_symbols() end,
	{ desc = "Buffer Symbols" })
vim.keymap.set("n", "<leader>fa", function() snacks.picker.lsp_workspace_symbols() end,
	{ desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>fr", function() snacks.picker.lsp_references() end,
	{ desc = "LSP References" })
vim.keymap.set("n", "<leader>fc", function() snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>fh", function() snacks.picker.help() end, { desc = "Help Tags" })

-- Lazy git
vim.keymap.set("n", "<leader>gl", function() snacks.lazygit() end, { desc = "Lazy Git" })

-- Terminal
vim.keymap.set({ "n", "t" }, "<C-\\>", function() snacks.terminal.toggle() end, { desc = "Toggle Terminal" })



-- Oil.nvim integration using Snacks.picker

local function oil_prompt(callback)
	snacks.picker.files({
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

vim.keymap.set(
	'n',
	'<leader>fe',
	function()
		if oil.get_current_dir() ~= nil then
			oil_prompt(oil.open)
		else
			oil_prompt(oil.open_float)
		end
	end,
	{ desc = "Open Directory in Float" }
)

vim.keymap.set('n', '<leader>eg', function() oil_prompt(oil.open) end, { desc = "Open Directory" })



vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})

vim.api.nvim_create_user_command('Highlights', function()
	snacks.picker.highlights()
end, { desc = 'Open Snacks highlights picker' })
