
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
local home = os.getenv("HOME")
if home then
    vim.opt.undodir = home .. "/.local/state/nvim/undodir"
else
    vim.opt.undodir = "C:\\Users\\ttn\\AppData\\Local\\nvim-data"
end

vim.opt.hlsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.autoread = true

vim.opt.clipboard="unnamedplus"

vim.opt.splitright = true
