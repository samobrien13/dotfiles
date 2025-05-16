return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"saghen/blink.cmp",
			dependencies = {
				"Kaiser-Yang/blink-cmp-avante",
				"rafamadriz/friendly-snippets",
			},
			version = "1.*",
			opts = {
				default = { "avante", "lsp", "path", "luasnip", "buffer" },
				providers = {
					avante = {
						module = "blink-cmp-avante",
						name = "Avante",
						opts = {
							-- options for blink-cmp-avante
						},
					},
				},
				keymap = { preset = "default" },
				appearance = {
					nerd_font_variant = "mono",
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
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
		local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities())

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"cssmodules_ls",
				"tailwindcss",
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"yamlls",
				"ruby_lsp",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["yamlls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.yamlls.setup({
						settings = {
							yaml = {
								keyOrdering = false,
							},
						},
					})
				end,
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"rubocop",
				"stylua",
			},
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
	end,
}
