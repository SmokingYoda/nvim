require("neodev").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = require("mason_installations"),
	automatic_installation = true,
	handlers = {
		function(server)
			local setup = require("lspconfig")[server]
			local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
			local navic = require("nvim-navic")

			setup.setup({
				on_attach = function(client, bufnr)
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
