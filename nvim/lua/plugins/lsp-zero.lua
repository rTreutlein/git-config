
return {
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

            local cmp = require('cmp')
            --local cmp_action = lsp.cmp_action()

            cmp.setup({
                preselect =  cmp.PreselectMode.None,

                completion = { completeopt = 'menu,menuone,popup,noinsert,noselect' },
                mapping = {
                    -- `Enter` key to confirm completion
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.confirm(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
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
            {'williamboman/mason.nvim',},

        },
        config = function ()
            require('neodev').setup()
            require('mason').setup()

            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function (event)
                    -- print("Attached")
                    local opts = {buffer = event.buf}
                    vim.keymap.set('n', '<leader>a', function ()
                        require('fzf-lua').lsp_code_actions{}
                    end, opts)
                    vim.keymap.set('v', '<leader>a', function ()
                        require('fzf-lua').lsp_code_actions{}
                    end, opts)
                    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })

            require('mason-lspconfig').setup({
                automatic_installation = true,
                ensure_installed = {
                    'lua_ls',
                    'pyright',
                    'tsserver',
                    'clangd',
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    hls = function() end
                },
            })

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup({})

            vim.keymap.set('n','<leader>ss', ':ClangdSwitchSourceHeader<CR>')
        end
    },
}
