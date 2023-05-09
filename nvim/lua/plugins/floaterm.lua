return {
    'numToStr/FTerm.nvim',
    opts = {
        cmd = os.getenv("SHELL") or "powershell.exe",
    },
    keys = {
        {"<A-t>", '<CMD>lua require("FTerm").toggle()<CR>', mode = 'n'},
        {"<A-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = 't'},
        {"<leader>gg"},
    },
}
