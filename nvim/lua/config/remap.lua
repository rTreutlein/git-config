
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv") --Go to next search result
vim.keymap.set("n", "N", "Nzzzv") --and center screen

vim.keymap.set("x", "<leader>p", "\"_dP")

local function reload()
    local plugin = require'lazy.core.config'.plugins["naVi"]
    require'lazy.core.loader'.reload(plugin)
    --print("Reloaded: navi")
end

vim.keymap.set("n", "<leader>n", reload)
