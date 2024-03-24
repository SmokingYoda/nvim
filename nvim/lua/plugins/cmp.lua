local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
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
		{ name = "copilot" },
		{ name = "nvim_lsp",     priority = 700 },
		{ name = "luasnip",      priority = 400 },
		{ name = "buffer-lines", priority = 300 },
		{ name = "bufname",      priority = 200 },
		{ name = "calc",         priority = 100 },
		{ name = "spell",        priority = 500 },
		{ name = "buffer",       priority = 600 },
	},
	formatting = {
		ellipsis_char = "...",
		max_width = 100,
		format = require("lspkind").cmp_format({
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
})

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
	matching = { disallow_symbol_nonprefix_matching = false },
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})
