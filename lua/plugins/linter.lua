return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufEnter", "InsertLeave" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- go = { "golangcilint" },
			-- javascript = { "eslint" },
			-- typescript = { "eslint" },
			python = { "ruff" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
