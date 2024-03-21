require("nvim-treesitter.configs").setup({
	ensure_installed = require("treesitter_installations"),
	highlight = { enabled = true },
	indent = { enabled = true },
})
