local builting_plugins = { "matchit" , "matchparen", "tutor_mode_plugin", "zipPlugin", "gzip", "shada_plugin" }
for i = 1, #builting_plugins do
    vim.g['loaded_' .. builting_plugins[i]] = true
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require('lazy').setup('plugins')

require('config')

vim.cmd.colorscheme "catppuccin-mocha"

local lazygit = require'FTerm':new{cmd = "lazygit"}
vim.keymap.set('n', '<leader>gg', function() lazygit:toggle() end)
