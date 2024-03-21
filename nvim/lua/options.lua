local settings = {
	laststatus = 3,
	showmode = false,
	clipboard = "unnamedplus",
	cursorline = true,
	cursorlineopt = "number",
	expandtab = true,
	shiftwidth = 4,
	smartindent = true,
	tabstop = 4,
	softtabstop = 4,
	fillchars = { eob = " " },
	ignorecase = true,
	smartcase = true,
	mouse = "a",
	number = true,
	numberwidth = 4,
	ruler = false,
	signcolumn = "yes",
	splitbelow = true,
	splitright = true,
	timeoutlen = 400,
	undofile = true,
	updatetime = 250,
	termguicolors = true,
}

for n, v in ipairs(settings) do
	vim.opt[n] = v
end

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")
vim.cmd("colorscheme github_dark_dimmed")
