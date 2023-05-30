return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"c","cpp","lua","vim","vimdoc","python","yaml","html","svelte"},
            highlight = {
                enable = true
            },
            indent = { enable = true },
            matchup = { enable = true },
        }
    end
}
