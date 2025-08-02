return {
	{ "mason-org/mason.nvim", event = { "VeryLazy" }, opts = {} },
	{
		-- tpope the GOAT.
		"tpope/vim-sleuth",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ignore_install = { "org" },
				highlight = {
					enable = true,
					-- additional_vim_regex_highlighting = { "kotlin" },
				},
				indent = {
					enable = false,
				},
				incremental_jelection = {
					enable = true,
					keymaps = {
						init_selection = "<M-t>",
						node_incremental = "<M-t>",
						scope_incremental = "<M-T>",
						node_decremental = "<M-r>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = { "BufReadPost" },
		dependencies = { "kevinhwang91/promise-async" },
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		},
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
		keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" } },
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
	},
}
