local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  'clangd',
  'cmake',
  'lua_ls',
  'vimls',
  'html',
  'pyright',
  'tsserver',
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', '<leader>a', ':CodeActionMenu<CR>', {buffer = true})
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = true})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.keymap.set('n','<leader>ss', ':ClangdSwitchSourceHeader<CR>')

local cmp = require('cmp')

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
  }
})
