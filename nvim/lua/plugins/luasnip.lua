return {
	'L3MON4D3/LuaSnip',
	name = 'luasnip',
	dependencies = { 'saadparwaiz1/cmp_luasnip' },
	build = "make install_jsregexp",
	config = function()
		require('luasnip.loaders.from_lua').load({ paths = os.getenv('DOT_FILES') .. "/nvim/snippets" })
	end
}
