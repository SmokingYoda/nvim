local nmap = function(key, cmd, desc)
	require("which-key").register({ [key] = { cmd, desc }}, { mode = "n" })
end

local imap = function(key, cmd, desc)
	require("which-key").register({ [key] = { cmd, desc }}, { mode = "i" })
end

local vmap = function(key, cmd, desc)
	require("which-key").register({ [key] = { cmd, desc }}, { mode = "v" })
end

nmap(" f", ":lua vim.lsp.buf.format({ async = true})<cr>", "Format current file")
nmap("<f3>", ":Telescope find_files<cr>", "Show files")
nmap("<f4>", ":Neogit<cr>", "Show Neogit.")

nmap("<c- >", ":Lspsaga hover_doc<cr>", "Show hover docs.")
imap("<c- >", ":Lspsaga hover_doc<cr>", "Show hover docs.")
vmap("<c-a>", ":sort<cr>", "Sorts current selection.")
