return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		event = "InsertEnter",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup({})

			local ls = require("luasnip")
			vim.keymap.set({ "i", "s" }, "<M-n>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)
		end,
	},
	{
		"xzbdmw/colorful-menu.nvim",
		-- lazy = true,
		opts = {},
	},

	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"xzbdmw/colorful-menu.nvim",
		},
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
				window = {
					show_documentation = true,
				},
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
						treesitter = { "lsp" },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "cmdline" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
