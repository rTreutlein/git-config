return {
    --Depency for other things
    'nvim-lua/plenary.nvim',

    --Git
    'lewis6991/gitsigns.nvim',
    'kdheepak/lazygit.nvim',

    --Cmake
    'Shatur/neovim-tasks',

    --General
    'psliwka/vim-smoothie', --Smooth Scroling with C-D C-F or PageUpDown

    'andymass/vim-matchup', --Treesitter powered %

    'tpope/vim-sleuth', --Autodetect shiftwidht and expandtab

    --Formatting
    'ntpeters/vim-better-whitespace', --Show trailing whitespace and remvoe
    'junegunn/vim-easy-align', --Align Text simply

    --Visual
    'iCyMind/NeoSolarized', --Color Scheme

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    --Movement
    'farmergreg/vim-lastplace', --Open File at last edit location
    'easymotion/vim-easymotion', --Show possible Search Targets to Jump to
    'ggandor/leap.nvim', --Nvims answer to the mouse

    'numToStr/Comment.nvim', --Toggle comments

    'nvim-tree/nvim-web-devicons',

}
