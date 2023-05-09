
return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function ()
            require'lsp-zero.settings'.preset({})
        end
    },
    --Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'saadparwaiz1/cmp_luasnip'},
            {'L3MON4D3/LuaSnip'},
        },
        config = function ()
            require'lsp-zero.cmp'.extend({
                set_sources = 'recommended',
                set_extra_mappings = true,
            })

            local cmp = require('cmp')
            --local cmp_action = lsp.cmp_action()

            cmp.setup({
                preselect = 'item',
                completion = { completeopt = 'menu,menuone,preview' },
                mapping = {
                    -- `Enter` key to confirm completion
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    --['<C-j>'] = cmp.mapping.select_next_item(),
                    --['<C-k>'] = cmp.mapping.select_prev_item(),
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'williamboman/mason-lspconfig.nvim'},
            {'folke/neodev.nvim'},
            {
                'williamboman/mason.nvim',
                build = function ()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {
                'weilbith/nvim-code-action-menu',
                cmd = 'CodeActionMenu',
            }

        },
        config = function ()
            local lsp = require'lsp-zero'

            require'neodev'.setup()

            lsp.ensure_installed({
                'clangd', 'cmake', 'lua_ls', 'vimls',
                'html', 'pyright', 'tsserver',
            })

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                vim.keymap.set('n', '<leader>a', ':CodeActionMenu<CR>', {buffer = true})
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = true})
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()

            vim.keymap.set('n','<leader>ss', ':ClangdSwitchSourceHeader<CR>')
        end
    },
}
