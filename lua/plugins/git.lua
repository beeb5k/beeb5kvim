return {
	{
		"NeogitOrg/neogit",
		keys = {
			{
				"<leader>ng",
				function()
					require("neogit").open()
				end,
				desc = "Open Neogit",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "sindrets/diffview.nvim",
			"folke/snacks.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {},
	},
}
