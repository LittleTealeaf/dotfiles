local snacks = require('snacks')
local oil = require('oil')

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
	rename = { enabled = true },
	input = {
		enabled = false,
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
			wo = {
				winhighlight = "Normal:NormalFloatAlt"
			},
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
		margin = { bottom = 1, right = 0 }
	},
	picker = {
		layout = "select",
		enabled = true,
		ui_select = true,
		actions = vim.tbl_extend("force", require('trouble.sources.snacks').actions,
			{
				-- Custom toggle & move actions
				toggle_next = function(picker)
					picker:action("toggle")
					picker:action("list_down")
				end,
				toggle_prev = function(picker)
					picker:action("toggle")
					picker:action("list_up")
				end,
			}),
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

vim.keymap.set('n', '<leader>fe', picker('explorer'), {desc = "Explorer"})

vim.keymap.set('n', '<leader>fs', picker('smart', { layout = "select" }), { desc = "Smart" })
vim.keymap.set('n', '<leader>fd', picker('files', { layout = 'select' }), { desc = "Files" })

vim.keymap.set('n', '<leader<fn>', picker('notifications'), { desc = "Notifications" })

vim.keymap.set('n', '<leader>fg', picker('grep', { layout = 'ivy_split' }), { desc = "Grep" })
vim.keymap.set('n', '<leader>fw', picker('grep_word', { layout = 'ivy_split' }), { desc = "Grep Word" })
vim.keymap.set('n', '<leader>fl', picker('lines', { layout = 'ivy_split' }), { desc = "Lines" })

vim.keymap.set('n', '<leader>fz', picker('lsp_symbols', { layout = 'sidebar' }), { desc = "Lsp Symbols" })
vim.keymap.set('n', '<leader>fa', picker('lsp_workspace_symbols', { layout = 'sidebar' }), { desc = "Workspace Symbols" })

vim.keymap.set('n', '<leader>fc', snacks.picker.commands, { desc = "Commands" })
vim.keymap.set('n', '<leader>fh', snacks.picker.help, { desc = "Help" })

vim.keymap.set('n', '<leader>fm', picker('marks', { layout = 'sidebar' }), { desc = "Marks" })

-- Git
vim.keymap.set("n", "<leader>gl", function() snacks.lazygit() end, { desc = "Lazy Git" })
vim.keymap.set("n", "<leader>gs", function() snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set('n', '<leader>gb', snacks.picker.git_branches, { desc = "Git Branch" })

vim.keymap.set('n', '<leader>gy', picker('git_log', { layout = 'ivy_split' }), { desc = "Git Log" })
vim.keymap.set('n', '<leader>gu', picker('git_log_file', { layout = 'ivy_split' }), { desc = "Git Log File" })
vim.keymap.set('n', '<leader>gi', picker('git_log_line', { layout = 'ivy_split' }), { desc = "Git Log Line" })

-- Terminal
vim.keymap.set({ "n", "t" }, "<C-\\>", function() snacks.terminal.toggle() end, { desc = "Toggle Terminal" })



-- Oil.nvim integration using Snacks.picker

local function oil_prompt(callback)
	-- Use Snacks.picker.pick to define a custom process source
	Snacks.picker.pick({
		title = "Open Directory",
		finder = "proc",
		cmd = "fd",
		args = { "--type", "d", "--hidden", "--exclude", ".git" },
		layout = "select",
		-- Important: transform ensures the picker UI handles the items as directories
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
