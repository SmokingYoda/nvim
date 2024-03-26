return function()
	for buf in pairs(vim.api.nvim_list_wins()) do
		print(vim.api.nvim_win_get_buf(buf))
	end
end
