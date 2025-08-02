return {
	"stevearc/conform.nvim",
	event = { "FileType" },
	opts = {
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},

		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			go = { "gofumpt", "golines" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			python = {
				"ruff_fix",
				"ruff_format",
				"ruff_organize_imports",
			},
			-- cmake = { "cmake_format" },
			-- rust = { "rustfmt", lsp_format = "fallback" },
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 500,
			})
		end, {
			desc = "[F]or[M]at",
		})
	end,
}
