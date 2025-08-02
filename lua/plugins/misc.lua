return {
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git",
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		-- keys = {
		-- 	{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		-- 	{ "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		-- 	{ "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		-- 	{ "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		-- },
		config = function()
			local function grapple_default_select(path)
				if vim.startswith(path, "oil://") then
					require("oil").open(path)
				elseif vim.startswith(path, "https://") then
					vim.ui.open(path)
				else
					vim.cmd.edit(path)
				end
			end

			require("grapple").setup({
				command = grapple_default_select,
			})

			local function grapple_select(index)
				-- Select based on URI "scheme"
				require("grapple").select({
					index = index,
					-- command = grapple_default_select,
				})
			end
			vim.keymap.set("n", "<leader>ha", function()
				require("grapple").tag({ path = vim.fn.expand("%:p") })
			end, { noremap = true, silent = true, desc = "grapple append" })
			vim.keymap.set("n", "<leader>hr", function()
				require("grapple").untag({ path = vim.fn.expand("%:p") })
			end, { noremap = true, silent = true, desc = "grapple remove" })
			vim.keymap.set("n", "<leader>ht", function()
				require("grapple").toggle()
			end, { noremap = true, silent = true, desc = "grapple toggle" })
			vim.keymap.set(
				"n",
				"<leader>hm",
				[[<cmd>Grapple open_tags<CR>]],
				{ noremap = true, silent = true, desc = "open grapple tags menu" }
			)
			vim.keymap.set(
				"n",
				"<leader>hs",
				[[<cmd>Grapple open_scopes<CR>]],
				{ noremap = true, silent = true, desc = "open grapple scopes menu" }
			)
			vim.keymap.set(
				"n",
				"<leader>hl",
				[[<cmd>Grapple open_loaded<CR>]],
				{ noremap = true, silent = true, desc = "open grapple loaded scopes menu" }
			)
			vim.keymap.set(
				"n",
				"<leader>hc",
				[[<cmd>Grapple cycle forward<CR>]],
				{ noremap = true, silent = true, desc = "open grapple loaded scopes menu" }
			)
			vim.keymap.set("n", "<M-1>", function()
				grapple_select(1)
			end, { noremap = true, silent = true, desc = "Grapple Select index 1" })
			vim.keymap.set("n", "<M-2>", function()
				grapple_select(2)
			end, { noremap = true, silent = true, desc = "Grapple Select index 2" })
			vim.keymap.set("n", "<M-3>", function()
				grapple_select(3)
			end, { noremap = true, silent = true, desc = "Grapple Select index 3" })
			vim.keymap.set("n", "<M-4>", function()
				grapple_select(4)
			end, { noremap = true, silent = true, desc = "Grapple Select index 4" })
			vim.keymap.set("n", "<M-5>", function()
				grapple_select(5)
			end, { noremap = true, silent = true, desc = "Grapple Select index 5" })
			vim.keymap.set("n", "<M-6>", function()
				grapple_select(6)
			end, { noremap = true, silent = true, desc = "Grapple Select index 6" })
			vim.keymap.set("n", "<M-7>", function()
				grapple_select(7)
			end, { noremap = true, silent = true, desc = "Grapple Select index 7" })
			vim.keymap.set("n", "<M-8>", function()
				grapple_select(8)
			end, { noremap = true, silent = true, desc = "Grapple Select index 8" })
			vim.keymap.set("n", "<M-9>", function()
				grapple_select(9)
			end, { noremap = true, silent = true, desc = "Grapple Select index 9" })
			vim.keymap.set("n", "<M-0>", function()
				grapple_select(10)
			end, { noremap = true, silent = true, desc = "Grapple Select index 10" })
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = { "VeryLazy" },
		opts = {},
	},
	{
		"kawre/neotab.nvim",
		event = { "InsertEnter" },
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "jsx", "tsx", "xml", "typescriptreact" },
		opts = {},
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		opts = {
			themes = {
				"catppuccin-latte",
				"catppuccin-frappe",
				"catppuccin-macchiato",
				"catppuccin-mocha",
				"tokyonight-night",
				"tokyonight-storm",
				"tokyonight-day",
				"tokyonight-moon",
				"gruvbox",
				"kanagawa",
				"kanagawa-dragon",
				"kanagawa-wave",
				"kanagawa-lotus",
			},
			livePreview = true,
		},
	},
}
