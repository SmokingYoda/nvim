local cmp = require("cmp")
local ls = require("luasnip")
local lspkind = require("lspkind")

local hasSuggestion = function()
	local id = vim.api.nvim_get_namespaces()["github-copilot"]

	if id then
		local marks = vim.api.nvim_buf_get_extmarks(0, id, 0, -1, {})

		for _, mark in ipairs(marks) do
			if vim.api.nvim_buf_get_extmark_by_id(0, id, mark[1], {}) then
				return true
			end
		end
	end

	return false
end

cmp.setup({
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<cr>"] = cmp.mapping.confirm({ select = true }),
		["<down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<esc>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			elseif hasSuggestion() then
				vim.cmd("call copilot#Dismiss()")
			else
				fallback()
			end
		end),
	}, { "i", "s" }),
	sources = {
		{ name = "calc" },
		{ name = "luasnip" },
		{
			name = "nvim_lsp",
			entry_filter = function(entry)
				return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
			end,
		},
	},
	formatting = {
		format = lspkind.cmp_format({
			before = function(_, vim_item)
				return vim_item
			end,
		}),
	},
})

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
	matching = { disallow_symbol_nonprefix_matching = false },
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
