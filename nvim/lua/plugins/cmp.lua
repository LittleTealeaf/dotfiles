local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		'L3MON4D3/LuaSnip',
		name = 'luasnip',
		dependencies = { 'saadparwaiz1/cmp_luasnip' },
		build = "make install_jsregexp",
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'onsails/lspkind.nvim' }
		},
		name = 'cmp',
		opts = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			local lspkind = require('lspkind')

			return {
				formatting = {
					fields = { "kind", "abbr" },
					format = lspkind.cmp_format({
						mode = 'symbol',
					})
				},
				view = {
					entries = {
						name = 'custom',
						selection_order = 'near_cursor'
					}
				},
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = 'CursorLine:Visual,Search:None'
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = 'CursorLine:Visual,Search:None'
					})
				},
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
					['<CR>'] = cmp.mapping.confirm({ select = true })
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				})
			}
		end
	},
}
