return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    config = function ()
        require'nvim-tree'.setup{}
    end,
    keys = {
        {'<leader>t',":NvimTreeToggle<CR>", mode = 'n'}
    }
}
