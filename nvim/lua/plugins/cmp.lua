local function has_words_before()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		'hrsh7th/nvim-cmp',
		cond = vim.g.features.cmp,
		dependencies = {
			{ 'rcarriga/cmp-dap' },
			{ 'onsails/lspkind.nvim' },
			{
				'hrsh7th/cmp-nvim-lsp',
				name = 'cmp_nvim_lsp',
			},
			{
				'L3MON4D3/LuaSnip',
				name = 'luasnip',
			},
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ "saecki/crates.nvim" },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'jmbuhr/otter.nvim' },
		},
		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			local lspkind = require('lspkind')

			cmp.setup({
				formatting = {
					fields = { "kind", "abbr" },
					format = lspkind.cmp_format({
						mode = 'symbol',
					})
				},
				window = false and {
					completion = cmp.config.window.bordered({
						winhighlight = 'CursorLine:Visual,Search:None'
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = 'CursorLine:Visual,Search:None'
					}),
				} or {},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				mapping = {
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<C-CR>'] = function(fallback)
						fallback()
					end,
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					['<C-e>'] = cmp.mapping(cmp.mapping.close(), { 'i', 'c' }),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp', priority = 4 },
				}, {
					{ name = "crates", priority = 2 },
					{ name = 'luasnip', priority = 2 },
					{ name = 'otter' , priority = 2},
				}, {
					{ name = 'nvim_lua', priority = 1 },
					{ name = "path", priority = 1 },
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				completion = { autocomplete = false },
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				}
			})

			cmp.setup.cmdline(':', {
				completion = { autocomplete = false },
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})

			cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
				sources = {
					{ name = 'dap' }
				}
			})
		end
	},
}
