require("todo-comments").setup()
require("nvim-autopairs").setup({ check_ts = true })
require("nvim-surround").setup()
require("nvim-ts-autotag").setup()
require("neogen").setup()
require("project_nvim").setup()
require("conform").setup({
	lua = { "stylua" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	rust = { "rustfmt" },
})

local ts = require("telescope")

ts.setup()
ts.load_extension("projects")

require("neo-tree").setup({
	window = {
		mappings = { ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } } },
	},
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
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
