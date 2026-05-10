vim.o.complete = "o"
vim.o.completeopt = "menu,menuone,noselect,popup"
vim.o.autocomplete = false
vim.o.pumheight = 15


-- Char-Press wait
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		-- Create a one-shot listener that turns autocomplete back on
		-- only AFTER you've pressed a key in Insert mode
		vim.api.nvim_create_autocmd("InsertCharPre", {
			once = true,
			callback = function()
				vim.o.autocomplete = true
			end,
		})
	end,
})

-- Turn it back off when leaving Insert mode so it's ready for the next entry
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.o.autocomplete = false
	end,
})



-- Keybinds for Autocomplete

local function has_words_before()
	local col = vim.fn.col('.') - 1
	return col ~= 0 and vim.fn.getline('.'):sub(col, col):match('%s') == nil
end


vim.keymap.set('i', '<Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-n>'                          -- Next item in popup menu
	elseif vim.snippet.active({ direction = 1 }) then
		return '<cmd>lua vim.snippet.jump(1)<CR>' -- Neovim 0.10+ native snippet jump
	elseif has_words_before() then
		return '<C-x><C-o>'                     -- Trigger built-in Omnifunc
	else
		return '<Tab>'                          -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Autocomplete/Snippet Next" })

vim.keymap.set('i', '<S-Tab>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-p>' -- Previous item in popup menu
	elseif vim.snippet.active({ direction = -1 }) then
		return '<cmd>lua vim.snippet.jump(-1)<CR>'
	else
		return '<S-Tab>' -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Autocomplete/Snippet Prev" })

vim.keymap.set('i', '<C-;>', function()
	if vim.fn.pumvisible() == 1 then
		if vim.fn.complete_info().selected == -1 then
			return '<C-n><C-y>'
		else
			return '<C-y>'
		end
	else
		return '<C-;>' -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Confirm Autocomplete" })

vim.keymap.set('i', '<C-e>', function()
	if vim.fn.pumvisible() == 1 then
		return '<C-e>' -- Built-in keystroke to Cancel completion
	else
		return '<C-e>' -- Fallback
	end
end, { expr = true, replace_keycodes = true, desc = "Cancel Autocomplete" })


local lsp_kind_icons = {
	"󰉿", -- Text
	"󰆧", -- Method
	"󰊕", -- Function
	"", -- Constructor
	"󰜢", -- Field
	"󰀫", -- Variable
	"󰠱", -- Class
	"", -- Interface
	"", -- Module
	"󰜢", -- Property
	"󰑭", -- Unit
	"󰎠", -- Value
	"", -- Enum
	"󰌋", -- Keyword
	"", -- Snippet
	"󰏘", -- Color
	"󰈙", -- File
	"󰈇", -- Reference
	"󰉋", -- Folder
	"", -- EnumMember
	"󰏿", -- Constant
	"󰙅", -- Struct
	"", -- Event
	"󰆕", -- Operator
	"", -- TypeParameter
}

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("LspAttachAutocomplete", {}),
	callback = function(args)
		vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
			convert = function(item)
				-- Customize the menu or kind with icons
				return {
					kind = (lsp_kind_icons.lsp_kind_icons[item.kind]), -- Add a function icon
					abbr = item.label,
					menu = "",
				}
			end,
		})
	end
})
