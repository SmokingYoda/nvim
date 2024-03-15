require("alpha").setup(require("alpha.themes.startify").config)
require("fidget").setup()
require("dressing").setup({
    telescope = require("telescope.themes").get_dropdown()
})
require("colorizer").setup()
require("bufferline").setup()
require("lualine").setup()
require("ibl").setup()
require("project_nvim").setup()
require("neo-tree").setup()
local telescope = require("telescope")
telescope.setup({
    defaults = { file_ignore_patterns = { ".git/", ".node_modules/" }},
    ["ui-select"] = { require("telescope.themes").get_dropdown() }
})

telescope.load_extension("ui-select")
telescope.load_extension("projects")
telescope.load_extension("git_diffs")
telescope.load_extension("git_grep")
telescope.load_extension("lazygit")

require("gitui").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "rust", "markdown" },
    highlight = { enable = true, },
    indent = { enable = true },
    sync_install = true
})

require("luasnip.loaders.from_vscode").lazy_load()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "bashls", "rust_analyzer" }
})

local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<cr>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<up>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<down>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<c-space>"] = cmp.mapping.close(),
        ["<c-c>"] = cmp.mapping.abort(),
        ["<c-j>"] = cmp.mapping.scroll_docs(4),
        ["<c-k>"] = cmp.mapping.scroll_docs(-4)
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "buffer" } }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } })
})

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true }
})

local cap = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")
local nav = require("nvim-navbuddy")
nav.setup()
lsp.lua_ls.setup({
    on_attach = function(client, bufnr)
        nav.attach(client, bufnr)
    end,
    capabilities = cap
})

lsp.bashls.setup({
    on_attach = function(client, bufnr)
        nav.attach(client, bufnr)
    end,
    capabilities = cap
})

lsp.rust_analyzer.setup({
    on_attach = function(client, bufnr)
        nav.attach(client, bufnr)
    end,
    capabilities = cap
})
require("lsp_signature").setup()
require("Comment").setup()
require("nvim-autopairs").setup()
require("conform").setup()
require("neogen").setup()
