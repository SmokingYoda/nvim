vim.g.coq_settings = {
	["auto_start"] = "shut-up",
	["xdg"] = true,
	["keymap.recommended"] = true,
	["display.preview.enabled"] = false,
	["keymap.manual_complete"] = "",
	["keymap.manual_complete_insertion_only"] = true,
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = require("mason_installations"),
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
