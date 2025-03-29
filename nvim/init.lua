local builting_plugins = { "matchit" , "matchparen", "tutor_mode_plugin", "zipPlugin", "gzip", "shada_plugin" }
for i = 1, #builting_plugins do
    vim.g['loaded_' .. builting_plugins[i]] = true
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require('lazy').setup('plugins')

require('config')

vim.cmd.colorscheme "catppuccin-mocha"

local lazygit = require'FTerm':new{cmd = "lazygit"}
vim.keymap.set('n', '<leader>gg', function() lazygit:toggle() end)


---
-- Setup haskell LSP
---

vim.g.haskell_tools = {
  hls = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr, ht)
    print("Starting haskell-lsp")
    ---
    -- Suggested keymaps from the quick setup section:
    -- https://github.com/mrcjkb/haskell-tools.nvim#quick-setup
    ---

    local opts = { noremap = true, silent = true, buffer = bufnr, }
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts)
    -- Hoogle search for the type signature of the definition under the cursor
    vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
    -- Evaluate all code snippets
    vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', '<leader>rf', function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, opts)
    vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
    end,
  }
}
