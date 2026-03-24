return {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function ()
        local leap = require'leap'
        leap.add_default_mappings()
        vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#777777' })
    end,
}
