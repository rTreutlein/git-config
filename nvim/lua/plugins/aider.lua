return {
    'joshuavial/aider.nvim', --Toggle comments
    keys = {
        { "<A-a>" , function() require('aider').AiderOpen() end }
    }
}
