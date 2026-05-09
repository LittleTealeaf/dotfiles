vim.pack.add({
	'https://github.com/folke/snacks.nvim',
	'https://github.com/stevearc/oil.nvim',
})

local Snacks = require('snacks')

Snacks.setup({
	lazygit = { enabled = true },
	rename = { enabled = true },
	input = {
		enabled = true,
		win = {
			relative = "cursor",
			border = Transparent, -- Ensure TRANSPARENT is defined in your config
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
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Smart" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.files() end,
	{ desc = "Find Files (No Preview)" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fl", function() Snacks.picker.lines() end, { desc = "Search Buffer" })

-- Buffers & History
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fo", function() Snacks.picker.recent() end, { desc = "Old Files" })

-- LSP & Commands
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end,
	{ desc = "Buffer Symbols" })
vim.keymap.set("n", "<leader>fa", function() Snacks.picker.lsp_workspace_symbols() end,
	{ desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.lsp_references() end,
	{ desc = "LSP References" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Tags" })

-- Lazy git
vim.keymap.set("n", "<leader>gl", function() Snacks.lazygit() end, { desc = "Lazy Git" })

-- Terminal
vim.keymap.set({ "n", "t" }, "<C-\\>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })



-- Oil.nvim integration using Snacks.picker

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
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})
