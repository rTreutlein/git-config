return {
    {
        "nvim-telescope/telescope.nvim",
        --cmd = "Telescope",
        --enabled = false,
        opts = {
            pickers = {
                find_files = {
                    follow = true,
                    hidden = true,
                    no_ignore = true,
                }
            }
        },
        keys = {
            { "<leader>o", function() require('telescope.builtin').find_files() end, mode = "n", desc = "Telescope open file", silent = true },
            { "<leader>f", function() require('telescope.builtin').live_grep() end, mode = "n", desc = "Telescope live grep", silent = true  },
            { "<leader>b", function() require('telescope.builtin').buffers() end, mode = "n", desc = "Telescope buffers", silent = true  },
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        keys = {
            { "<leader>z", function() require('telescope').extensions.file_browser.file_browser() end, mode = "n", desc = "Telescope open file", silent = true },
        }
    }
}
