return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        ensure_installed = {"c","cpp","lua","vim","vimdoc","python","yaml","html"},
        highlight = {
            enable = true
        },
        indent = {enable = true},
        matchup = {enabled = true},
    },
}
