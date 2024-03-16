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
    defaults = { file_ignore_patterns = { ".git/", ".node_modules/" } },
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

local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<cr>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        ["<down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
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

require("mason").setup()

local mlsp = require("mason-lspconfig")
local cap = require("cmp_nvim_lsp").default_capabilities()
local nav = require("nvim-navbuddy")
local lspconfig = require("lspconfig")

nav.setup()

mlsp.setup({
    ensure_installed = { "lua_ls", "bashls", "rust_analyzer", "biome" },
})

mlsp.setup_handlers({
    function(lsp)
        lspconfig[lsp].setup({
            on_attach = function(client, bufnr)
                nav.attach(client, bufnr)
            end,
            capabilities = cap
        })
    end
})

local null_ls = require("null-ls")
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", " f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", " f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

require("prettier").setup()
require("lsp_signature").setup()
require("Comment").setup()
require("nvim-autopairs").setup()
require("conform").setup()
require("neogen").setup()
