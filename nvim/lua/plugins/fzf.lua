return {
    'ibhagwan/fzf-lua',
    dependencies = { 'junegunn/fzf', build = './install --bin', },
    --enabled = false,
    keys = {
        { "<A-o>", "<cmd>lua require('fzf-lua').files()<CR>", mode = "n", desc = "FZF open file", silent = true },
        { "<A-f>", "<cmd>lua require('fzf-lua').live_grep()<CR>", mode = "n", desc = "FZF live grep", silent = true  },
        { "<A-b>", "<cmd>lua require('fzf-lua').buffers()<CR>", mode = "n", desc = "FZF buffers", silent = true  },
    },
}
