-- CMP is used for command line only.

local cmp = require("cmp")

cmp.setup({
	snippet = {},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({}),
	sources = cmp.config.sources({{ name = "nvim_lsp"}}, {{ name = "buffer" }}),
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({{ name = "path" }}, {{ name = "cmdline" }})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {{ name = "buffer" }}
})
