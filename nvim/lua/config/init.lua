require("config.set")
require("config.remap")

local api = vim.api

api.nvim_create_autocmd({"BufNewFile","BufRead"},{pattern = {"*.cxxtest"}, command = "set syntax=cpp"})

api.nvim_create_autocmd({"BufWinEnter","BufEnter"}, {command = "if &buftype == 'terminal' | :startinsert | else | :stopinsert | endif"})

vim.filetype.add({extension = {metta = "metta"}})


