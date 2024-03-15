local wk = require("which-key")

local nmap = function(mapping)
    wk.register(mapping)
end

local vmap = function(mapping)
    wk.register(mapping, { mode = "v" })
end

nmap({ ["<f3>"] = { ":Telescope find_files<cr>", "Show files." } })
nmap({ ["<f10>"] = { ":Telescope projects<cr>", "Show projects." } })
nmap({ ["<f4>"] = { ":Telescope live_grep<cr>", "Search in files." } })
nmap({ ["<c- >"] = { ":lua vim.lsp.buf.hover()<cr>", "Show hover." } })
nmap({ [" f"] = { ":lua vim.lsp.buf.format({ async = true })<cr>", "Format file." } })
nmap({ ["<c-s>"] = { ":Navbuddy<cr>", "Show file structure." } })
