local wk = require("which-key")

local nmap = function(key, cmd, desc)
	wk.register({
		[key] = { cmd, desc },
	}, { mode = "n", noremap = true, remap = true, silent = true })
end

local imap = function(key, cmd, desc)
	wk.register({
		[key] = { cmd, desc },
	}, { mode = "i", noremap = true, remap = true, silent = true })
end

local vmap = function(key, cmd, desc)
	wk.register({
		[key] = { cmd, desc },
	}, { mode = "v", noremap = true, remap = true, silent = true })
end

-- Normal mode mappings

nmap("<f2>", ":Lspsaga rename<cr>", "Rename symbol.")
nmap(" f", ":lua vim.lsp.buf.format({ async = true})<cr>", "Format current file.")
nmap("gd", ":lua require('fzf-lua').lsp_declarations()<cr>", "Go to declaration.")
nmap("gD", ":lua require('fzf-lua').lsp_definitions()<cr>", "Go to definitions.")
nmap("<f5>", ":Lspsaga term_toggle<cr>", "Show terminal.")

-- SHIFT + <key>
nmap("<s-l>", "<c-w>l", "Move to the right window.")
nmap("<s-h>", "<c-w>h", "Move to the left window.")
nmap("<s-j>", "<c-w>j", "Move to the bottom window.")
nmap("<s-k>", "<c-w>k", "Move to the top window.")

-- CTRL + <key>
nmap("<c-v>", "pG", "Paste and move to the end of the line.")
nmap("<c-a>", "ggVG", "Select all text.")
nmap("<c-s>", ":w<cr>", "Save the file.")
nmap("<c-b>", "viB", "Select current block.")
nmap("<c-f>", ":Telescop live_grep<cr>", "Live grep.")
nmap("<c-q>", ":q<cr>", "Quit.")
nmap("<c-s-q>", ":qa<cr>", "Quit all.")

-- ALT + <key>
nmap("<a-k>", ":m+1<cr>==", "Move the current line up.")
nmap("<a-j>", ":m-2<cr>==", "Move the current line down.")
nmap("<a-h>", "v0d", "Delete from cursor to the beginning of the line.")
nmap("<a-l>", "v$d", "Delete from cursor to the end of the line.")

-- WIN + <key>
nmap("<d-e>", ":Neotree toggle<cr>", "Toggles the neotree.")
nmap("<d-p>", ":Telescope projects<cr>", "Show projects.")
nmap("<d-f>", ":Telescope find_files<cr>", "Find files.")

-- Visual mode mappings

-- CTRL + <key>
vmap("<c-f>", ":lua require('fzf-lua').grep_visual()", "Search visual.")

-- Insert mode mappings

-- WIN + <key>
imap("<d-h>", "<esc>:lua require('fzf-lua').lsp_declarations()<cr>", "Go to declaration.")
imap("<d-l>", "<esc>:lua require('fzf-lua').lsp_definitions()<cr>", "Go to definitions.")

-- CTRL + <key>
imap("<c-s>", "<esc>:w<cr>", "Save the file.")
imap("<c-f>", "<esc>:lua require('fzf-lua').grep_cword()<cr>", "Search word under cursor.")
imap("<c-c>", "<esc>Vc", "Copy the current line.")
imap("<c-v>", "<esc>pi", "Paste the copied line.")
imap("<a-s>", "<esc>:wqa<cr>", "Save all and quit.")
