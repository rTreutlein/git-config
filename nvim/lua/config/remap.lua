
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

--Move through wrappen line
vim.keymap.set("n","j", "gj", {silent = true})
vim.keymap.set("n","k", "gk", {silent = true})

--Easily move between windows
vim.keymap.set("", "<C-j>","<C-w>j")
vim.keymap.set("", "<C-h>","<C-w>h")
vim.keymap.set("", "<C-k>","<C-w>k")
vim.keymap.set("", "<C-l>","<C-w>l")
vim.keymap.set("", "<leader>j","<C-j>")
vim.keymap.set("", "<leader>h","<C-h>")
vim.keymap.set("", "<leader>k","<C-k>")
vim.keymap.set("", "<leader>l","<C-l>")

local function lazygitEsc()
    if vim.fn.stridx(vim.api.nvim_buf_get_name(0),'lazygit') > -1 then
        return "<Esc>"
    else
        return "<C-\\><C-n>"
    end
end

vim.keymap.set("t","<Esc>", lazygitEsc, { noremap = true,expr = true })

--Save
vim.keymap.set("n", "<leader>w", ":w<CR>" )
vim.keymap.set("n", "<leader>x", ":wa<CR>:qa<CR>" )

vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
