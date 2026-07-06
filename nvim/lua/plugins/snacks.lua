vim.pack.add({ Github('folke/snacks.nvim'), })
local snacks = require('snacks')


local picker_actions = require('trouble.sources.snacks').actions
picker_actions['flash'] = function(picker)
	require("flash").jump({
		pattern = "^",
		label = { after = { 0, 0 } },
		search = {
			mode = "search",
			exclude = {
				function(win)
					return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
				end,
			},
		},
		action = function(match)
			local idx = picker.list:row2idx(match.pos[1])
			picker.list:_move(idx, true, true)
		end,
	})
end


snacks.setup({
	lazygit = {
		enabled = true,
		win = {
			border = "rounded",
			wo = {
				winhighlight = "NormalFloat:NormalFloatAlt,FloatBorder:FloatBorderAlt"
			}
		}
	},
	input = {
		enabled = true,
		win = {
			relative = "cursor",
			row = 1,
			border = true,
			width = 45,
		}
	},
	image = { enabled = true },
	terminal = {
		enabled = true,
		win = {
			style = "minimal",
			border = "rounded",
			wo = {
				winhighlight = "Normal:NormalFloatAlt"
			},
		}
	},
	notifier = {
		enabled = true,
		style = "minimal",
		top_down = false,
		margin = { bottom = 1, right = 0 }
	},
	picker = {
		layout = "select",
		enabled = true,
		ui_select = true,
		actions = picker_actions,
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
					-- ["<A-q>"] = { "close", mode = { "i", "n" } },
					["<Tab>"] = { "list_down", mode = { "i", "n" } },
					["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
					-- ["<C-'>"] = { "toggle", mode = { "i", "n" } },
					["<C-Down>"] = { "select_and_next", mode = { "i", "n" } },
					["<C-Up>"] = { "select_and_prev", mode = { "i", "n" } },
					["<C-q>"] = { "qflist", mode = { "i", "n" } },
					["<C-t>"] = { "trouble_open", mode = { "i", "n" } },
					["<C-a>"] = { "select_all", mode = { "i", "n" } },
					["<C-s>"] = { "flash", mode = { "i", "n" } },
					["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
					["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
				},
			},
		},
		previewers = {
			git = { native = true },
		},
	},
})

local function picker(fn, opts)
	return function()
		snacks.picker[fn](opts)
	end
end


-- Pickers
vim.keymap.set('n', '<leader>ff', function() snacks.picker() end, { desc = "Smart" })

-- Generic
vim.keymap.set('n', '<leader>fb', picker('buffers', { layout = 'default' }), { desc = "Buffers" })
vim.keymap.set('n', '<leader>fn', picker('notifications'), { desc = "Notifications" })

-- Files and Folders
vim.keymap.set('n', '<leader>fp', picker('projects', { layout = "default" }), { desc = "Projects" })
vim.keymap.set('n', '<leader>fe', picker('explorer'), { desc = "Explorer" })
vim.keymap.set('n', '<leader>fj', picker('smart', { layout = "select" }), { desc = "Smart" })
vim.keymap.set('n', '<leader>fd', picker('files', { layout = 'default' }), { desc = "Files" })

-- Searching
vim.keymap.set('n', '<leader>fk', picker('grep', { layout = 'default' }), { desc = "Grep" })
vim.keymap.set('n', '<leader>fw', picker('grep_word', { layout = 'default' }), { desc = "Grep Word" })
vim.keymap.set('n', '<leader>fl', picker('lines', { layout = 'dropdown' }), { desc = "Lines" })

vim.keymap.set('n', '<leader>fm', picker('marks', { layout = 'dropdown' }), { desc = "Marks" })

-- LSP
vim.keymap.set('n', '<leader>fs', picker('lsp_symbols', { layout = 'dropdown' }), { desc = "Lsp Symbols" })
vim.keymap.set('n', '<leader>fa', picker('lsp_workspace_symbols', { layout = 'default' }), { desc = "Workspace Symbols" })
vim.keymap.set('n', '<leader>fr', picker('lsp_references', { layout = "default" }), { desc = "LSP References" })

-- Help
vim.keymap.set('n', '<leader>fc', snacks.picker.commands, { desc = "Commands" })
vim.keymap.set('n', '<leader>fh', picker('help', { layout = 'default' }), { desc = "Help" })

-- Git
vim.keymap.set("n", "<leader>gl", function() snacks.lazygit() end, { desc = "Lazy Git" })
vim.keymap.set("n", "<leader>gs", picker('git_status', { layout = 'default' }), { desc = "Git Status" })
vim.keymap.set('n', '<leader>gb', picker('git_branches', { layout = 'dropdown' }), { desc = "Git Branch" })

vim.keymap.set('n', '<leader>gy', picker('git_log', { layout = 'ivy' }), { desc = "Git Log" })
vim.keymap.set('n', '<leader>gu', picker('git_log_file', { layout = 'ivy' }), { desc = "Git Log File" })
vim.keymap.set('n', '<leader>gi', picker('git_log_line', { layout = 'ivy' }), { desc = "Git Log Line" })

-- Terminal
vim.keymap.set({ "n", "t" }, "<C-\\>", function() snacks.terminal.toggle() end, { desc = "Toggle Terminal" })



-- Oil.nvim integration using Snacks.picker

local function oil_prompt(callback)
	Snacks.picker.pick({
		title = "Open Directory",
		finder = "proc",
		cmd = "fd",
		args = { "--type", "d", "--hidden", "--exclude", ".git" },
		layout = "select",
		transform = function(item)
			item.file = item.text
			item.dir = true
		end,
		actions = {
			confirm = function(current_picker, item)
				current_picker:close()
				if item and item.file then
					callback(item.file)
				end
			end,
		},
	})
end

vim.keymap.set('n', '<leader>eg', function() oil_prompt(require('oil').open) end, { desc = "Open Directory" })

vim.api.nvim_create_user_command('Highlights', function()
	snacks.picker.highlights()
end, { desc = 'Open Snacks highlights picker' })
