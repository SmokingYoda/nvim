vim.g.mapleader = " "

local settings = {
	completeopt = "menu,menuone,noselect",
	cursorline = true,
	cursorlineopt = "number",
	expandtab = true,
	fillchars = { eob = " " },
	ignorecase = true,
	laststatus = 3,
	mouse = "a",
	number = true,
	numberwidth = 4,
	ruler = false,
	shiftwidth = 4,
	showmode = false,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	softtabstop = 4,
	spell = true,
	spelllang = "en_us",
	splitbelow = true,
	splitright = true,
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 400,
	undofile = true,
	updatetime = 250,
}

for n, v in ipairs(settings) do
	vim.opt[n] = v
end

vim.opt.sessionoptions:append("blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions")
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")
vim.cmd("colorscheme github_dark_dimmed")
