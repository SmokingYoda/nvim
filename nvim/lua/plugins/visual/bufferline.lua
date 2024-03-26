local bl = require("bufferline")

bl.setup({
	options = {
		close_command = function(n)
			require("mini.bufremove").delete(n, false)
		end,
		right_mouse_command = function(n)
			require("mini.bufremove").delete(n, false)
		end,
		show_buffer_close_icons = false,
		separator_style = { "|", "|" },
		always_show_bufferline = true,
		style_preset = bl.style_preset.minimal,
		numbers = function(opts)
			return string.format("%s", opts.ordinal)
		end,
		custom_filter = function(buf_number)
			return not vim.fn.bufname(buf_number):match("neo-tree filesystem [1]")
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "EcovimNvimTreeTitle",
				text_align = "center",
				separator = true,
			},
		},
	},
})
