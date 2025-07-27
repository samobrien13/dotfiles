return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"saghen/blink.cmp",
			dependencies = {
				{ "L3MON4D3/LuaSnip", version = "v2.*" },
				"rafamadriz/friendly-snippets",
				"solidjs-community/solid-snippets",
			},
			version = "1.*",
			opts = {
				snippets = {
					expand = function(snippet)
						require("luasnip").lsp_expand(snippet)
					end,
					active = function(filter)
						if filter and filter.direction then
							return require("luasnip").jumpable(filter.direction)
						end
						return require("luasnip").in_snippet()
					end,
					jump = function(direction)
						require("luasnip").jump(direction)
					end,
				},
				sources = {
					default = { "lsp", "path", "buffer" },
				},
				keymap = { preset = "default" },
				appearance = {
					nerd_font_variant = "mono",
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
				completion = {
					documentation = {
						auto_show = true,
					},
					menu = {
						border = "rounded",
						draw = {
							columns = {
								{ "kind_icon", "kind", gap = 1 },
								{ "label", "label_description", gap = 1 },
							},
							components = {
								label_description = {
									width = { max = 50 },
								},
								source_name = {
									text = function(ctx)
										return "[" .. ctx.source_name .. "]"
									end,
								},
							},
						},
					},
				},
			},
			opts_extend = { "sources.default" },
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
		{
			"youyoumu/pretty-ts-errors.nvim",
			opts = {
				auto_open = false,
			},
		},
	},
	config = function()
		local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities())

		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = true,
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
