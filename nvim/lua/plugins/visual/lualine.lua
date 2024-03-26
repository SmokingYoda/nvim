local fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")

function fname:init(options)
	fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group({ bg = "#6fcb9f" }, "filename_status_saved",
			self.options),
		modified = highlight.create_component_highlight_group(
			{ bg = "#fb2e01" },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function fname:update_status()
	local data = fname.super.update_status(self)

	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data

	return data
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	theme = "github_dark",
	globalstatus = true,
	disabled_filetypes = {
		statusline = {}, -- only ignores the ft for statusline.
		winbar = {},
	},
	sections = {
		lualine_a = {
			"mode",
			{ "b:gitsigns_head", icon = "" },
			{
				fname,
			},
		},
		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				update_in_insert = true,
				symbols = { error = " ", warn = " ", info = " ", hint = "➤ " },
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { { "diff", source = diff_source } },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {
		"fugitive",
		"mason",
		"neo-tree",
		"nvim-dap-ui",
		"trouble",
	},
})
