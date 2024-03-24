require("neodev").setup()
require("luasnip.loaders.from_vscode").lazy_load()

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.completion.tags,
		null_ls.builtins.diagnostics.markdownlint
	}
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = require("mason_installations"),
	automatic_installation = true,
	handlers = {
		function(server)
			local setup = require("lspconfig")[server]
			local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
			local navic = require("nvim-navic")
			local buddy = require("nvim-navbuddy")

			setup.setup({
				on_attach = function(client, bufnr)
					buddy.attach(client, bufnr)
					navic.attach(client, bufnr)
				end,
				capabilities = cmp_capabilities,
				settings = {
					Lua = { completion = { callSnippet = "Replace" } }
				},
			})
		end
	}
})
