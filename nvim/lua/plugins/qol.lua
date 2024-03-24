require("nvim-autopairs").setup({ check_ts = true })
require("nvim-surround").setup()
require("nvim-ts-autotag").setup()
require("neogen").setup()

require("conform").setup({
	lua = { "stylua" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	rust = { "rustfmt" },
})

require("neo-tree").setup({
	window = {
		mappings = { ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } } }
	}
})

require("neogit").setup()
require("treesj").setup({
	use_default_keymaps = true,
	check_syntax_errors = true,
	max_join_length = 120,
	cursor_behavior = "hold",
	notify = true,
	dot_repeat = true,
})
