vim.cmd("colorscheme gruvbox")

local plugin_settings = {
    -- copilot_no_tab_map = true
}

local settings = {
    foldcolumn = "1",
    foldlevel = 99,
    foldlevelstart = 99,
    foldenable = true,
    laststatus = 3,
    showmode = false,
    cursorline = true,
    cursorlineopt = "number",
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    tabstop = 4,
    softtabstop = 4,
    ignorecase = true,
    smartcase = true,
    mouse = "a",
    number = true,
    numberwidth = 2,
    ruler = false,
    signcolumn = "yes",
    splitbelow = true,
    splitright = true,
    timeoutlen = 400,
    undofile = true,
    updatetime = 250,
    fillchars = { eob = " " },
}

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")
vim.opt.clipboard:append("unnamedplus")

for setting, value in pairs(plugin_settings) do
    vim.g[setting] = value
end

for setting, value in pairs(settings) do
    vim.opt[setting] = value
end
