local wk = require("which-key")

local test = function()
	for buf in pairs(vim.api.nvim_list_bufs()) do
		print(buf)
	end
end

wk.register({
	["<c-v>"] = { test(), "" },
	["<c-c>"] = { "<c-w>q", "Close window." },
	["<c-"] = {
		name = "Control motions.",
		["s>"] = {
			name = "Show motions.",
			["f"] = { ":Telescope find_files<cr>", "Show files." },
			["g"] = { ":Neogit<cr>", "Show neogit." },
			["t"] = { ":TroubleToggle<cr>", "Show Trouble." },
			["c"] = { ":Telescope git_bcommits<cr>", "Show file commits." },
			["e"] = { ":Neotree toggle<cr>", "Show file explorer." },
		},
		["l>"] = {
			name = "Line motions.",
			["j"] = { ":m+1<cr>==", "Move line down." },
			["k"] = { ":m-2<cr>==", "Move line up." },
		},
	},
	["<leader>"] = {

		["f"] = {
			{ ":lua vim.lsp.buf.format({ async = true })<cr>", "Format file." },
		},
		["s"] = {
			["t"] = { ":w<cr>", "Save." },
			["q"] = {
				["t"] = { ":wq<cr>", "Save and quit." },
				["a"] = { ":wqa<cr>", "Save and quit all." },
			},
			["a"] = { ":wa<cr>", "Save all." },
		},
		["o"] = {
			name = "Order motions.",
			["b"] = { "viB:sort<cr>", "Sort block." },
		},
	},
})

wk.register({
	["<c-s>"] = { ":sort<cr>", "Sort selected lines." },
}, { mode = "v" })
