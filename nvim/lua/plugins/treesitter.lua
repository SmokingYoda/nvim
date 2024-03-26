require("nvim-treesitter.configs").setup({
	ensure_installed = require("treesitter_installations"),
	highlight = { enabled = true, dditional_vim_regex_highlighting = false },
	indent = { enabled = true },
})
