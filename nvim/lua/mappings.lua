local wk = require("which-key")

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
