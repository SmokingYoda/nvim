vim.g.coq_settings = {
	["auto_start"] = "shut-up",
	["xdg"] = true,
	["keymap.recommended"] = false,
	["display.preview.enabled"] = false,
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"biome",
		"clangd",
		"cssls",
		"gopls",
		"html",
		"hydra_lsp",
		"intelephense",
		"lemminx",
		"lua_ls",
		"marksman",
		"omnisharp",
		"omnisharp_mono",
		"powershell_es",
		"pyre",
		"rust_analyzer",
		"sqlls",
		"tailwindcss",
		"tsserver",
		"vimls",
		"zls",
	},
	automatic_installation = true,
	handlers = {
		function(server)
			local setup = require("lspconfig")[server]
			local coq_capabilities = require("coq").lsp_ensure_capabilities()
			local navic = require("nvim-navic")

			setup.setup({
				on_attach = function(client, bufnr)
					navic.attach(client, bufnr)
				end,
				capabilities = coq_capabilities,
				settings = {
					Lua = { completion = { callSnippet = "Replace" } }
				},
			})
		end
	}
})

require("coq_3p") {
	{ src = "bc",      short_name = "MATH", precision = 6 },
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
	{ src = "dap" },
}
