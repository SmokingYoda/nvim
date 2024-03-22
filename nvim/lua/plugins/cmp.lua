local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<c-c>"] = cmp.mapping.close(),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	}),
	sources = {
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 3 },
		{ name = "buffer", group_index = 2},
	},
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
	matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } }
})
