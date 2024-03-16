local wk = require("which-key")

local leader = " "

local nmap = function(mapping)
    wk.register(mapping, { mode = "n", prefix = leader })
end

local vmap = function(mapping)
    wk.register(mapping, { mode = "v", prefix = leader })
end

local imap = function(mapping)
    wk.register(mapping, { mode = "i", prefix = leader })
end

wk.register({
{["<f10>"] = { ":Telescope projects<cr>", "Open projects." }},
    {["<f3>"] = { ":Telescope find_files<cr>", "Show files." }},
})

nmap({
    {["<s-s>"] = { ":w<cr>", "Save." }},
    {["<s-s>q"] = { ":wq<cr>", "Save and quit." }},
    {["<s-q>q"] = { ":q!<cr>", "Discard and quit." }},
})
