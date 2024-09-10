return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"c","cpp","lua","vim","vimdoc","python","yaml","html","svelte","haskell","scheme"},
            highlight = {
                enable = true
            },
            indent = { enable = true },
            matchup = { enable = true },
        }
        vim.treesitter.language.register('scheme', 'metta')
    end
}
