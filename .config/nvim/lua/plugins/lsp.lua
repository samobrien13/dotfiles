return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            'saghen/blink.cmp',
            dependencies = { 'rafamadriz/friendly-snippets' },
            version = '1.*',
            opts = {
                keymap = { preset = 'default' },
                appearance = {
                    nerd_font_variant = 'mono'
                },
                fuzzy = { implementation = "prefer_rust_with_warning" }
            },
        },
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },

    config = function()
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities()
        )

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                'cssmodules_ls',
                'tailwindcss',
                'eslint',
                'lua_ls',
                'rust_analyzer',
                'ts_ls',
                'yamlls',
                'ruby_lsp',
                'rubocop',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ['yamlls'] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.yamlls.setup {
                        settings = {
                            yaml = {
                                keyOrdering = false
                            }
                        }
                    }
                end,
            }
        })

        vim.diagnostic.config({
            virtual_text = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                header = "",
                prefix = "",
            },
        })
    end
}
