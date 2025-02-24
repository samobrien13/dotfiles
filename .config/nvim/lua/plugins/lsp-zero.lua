return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
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

