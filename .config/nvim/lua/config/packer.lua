-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'ray-x/aurora',
        as = 'aurora',
    })
    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
    })


    use({
        "rebelot/heirline.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        }
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context");

    -- Git
    use("tpope/vim-fugitive")
    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    })

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            keys = {
                { "<tab>",   false, mode = { "i", "s" } },
                { "<s-tab>", false, mode = { "i", "s" } },
            },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            {
                "L3MON4D3/LuaSnip",
                keys = {
                    { "<tab>",   false, mode = { "i", "s" } },
                    { "<s-tab>", false, mode = { "i", "s" } },
                },
            },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Formatting
    use("jose-elias-alvarez/null-ls.nvim")
    use('MunifTanjim/prettier.nvim')

    -- AI
    -- use("github/copilot.vim")
    use({
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    })
    use({
        "olimorris/codecompanion.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    })
end)
