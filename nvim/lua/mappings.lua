local wk = require("which-key")

wk.register({
	["<f1>"] = {},
	["<f2>"] = {},
	["<f3>"] = {},
	["<f4>"] = {},
	["<f5>"] = {},
	["<f6>"] = {},
	["<f7>"] = {},
	["<f8>"] = {},
	["<f9>"] = {},
	["<f10>"] = {},
	["<f11>"] = {},
	["<f12>"] = {},
})

wk.register({
	["<f3>"] = { ":Telescope find_files<cr>", "Show files." },
	["<f4>"] = { ":Neogit<cr>", "Show Neogit." },
	["<c-s>g"] = { ":Telescope git_bcommits<cr>", "Show file's commits." },
	["<c-s>f"] = { ":Neotree toggle<cr>", "Show Neogit." },
	[" f"] = { ":lua vim.lsp.buf.format({ async = true })<cr>", "Format current file." },
	["<c- >"] = { ":Lspsaga hover_doc<cr>", "Show hover" },
	["gd"] = { ":Lspsaga goto_definition<cr>", "Goto definition." },
	["<c-s>t"] = { ":TroubleToggle<cr>", "Toggle trouble." },
	["<f5>"] = { ":split | terminal cargo run<cr>", "Run cargo." },
})
