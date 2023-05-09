return {
    'ibhagwan/fzf-lua',
    dependencies = { 'junegunn/fzf', build = './install --bin', },
    enabled = false,
    keys = {
        { "<leader>o", "<cmd>lua require('fzf-lua').files()<CR>", mode = "n", desc = "FZF open file", silent = true },
        { "<leader>f", "<cmd>lua require('fzf-lua').live_grep()<CR>", mode = "n", desc = "FZF live grep", silent = true  },
        { "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", mode = "n", desc = "FZF buffers", silent = true  },
    },
}
