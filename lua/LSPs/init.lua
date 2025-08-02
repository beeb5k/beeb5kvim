vim.lsp.enable({
	"qmlls",
	"gopls",
	"lua_ls",
	"clangd",
	"harper",
	"pyrefly",
	"tsserver",
	"rust_analyzer",
})

vim.lsp.inlay_hint.enable(true)
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git", ".editorconfig", "flake.nix", "shell.nix", "flake.lock" },
})

--- Grammer ---
vim.lsp.config("harper", {
	cmd = { "harper-ls", "--stdio" },
	filetypes = { "markdown", "text", "gitcommit" },
})

--- Qml ---
vim.lsp.config("qmlls", {
	cmd = { "qmlls", "-E", "-I", "/usr/lib/qt6/qml" },
	filetypes = { "qml", "qmljs" },
})

--- Typescript, Javascript, React & tsx/jsx ---
vim.lsp.config("tsserver", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"typescript",
		"javascript",
		"typescript.tsx",
		"javascript.jsx",
		"typescriptreact",
		"javascriptreact",
	},
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
})

--- C & C++ ---
vim.lsp.config("clangd", {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		".clangd",
		"Makefile",
		"makefile",
		"CMakeLists.txt",
		"meson.build",
		"build.ninja",
	},
	settings = {
		clangd = {
			InlayHints = {
				Enabled = true,
				ParameterNames = true,
				TypeHints = true,
				ChainedCalls = true,
			},
			fallbackFlags = { "-std=c17" },
		},
	},
})

--- Golang ---
vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
	root_markers = { "go.mod" },
	-- settings = {
	-- 	gopls = {
	-- 		analyses = {
	-- 			unusedparams = true,
	-- 			useany = true,
	-- 			nilness = true,
	-- 		},
	-- 		staticcheck = true,
	-- 		codelenses = {
	-- 			test = true,
	-- 			tidy = true,
	-- 			upgrade_dependency = true,
	-- 		},
	-- 	},
	-- },
})

--- Python ---
vim.lsp.config("pyrefly", {
	cmd = { "pyrefly", "lsp" },
	filetypes = { "python" },
	root_markers = { "pyrefly.toml", "pyproject.toml" },
	settings = {
		pyrefly = {
			inlayHints = true,
		},
	},
})

--- Lua ---
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			hint = {
				enabled = true,
			},
			runtime = {
				version = "LuaJIT",
			},
			formatters = {
				ignoreComments = true,
			},
			signatureHelp = {
				enabled = true,
			},
			diagnostics = {
				globals = { "vim" },
				-- disable = { "missing-fields" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					unpack(vim.api.nvim_get_runtime_file("", true)),
				},
			},
			completion = {
				callSnippet = "Replace",
			},
			telemetry = {
				enabled = false,
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
	settings = {
		["rust-analyzer"] = {
			inlayHints = {
				enable = true,
				bindingModeHints = { enable = true },
				chainingHints = { enable = true },
				closingBraceHints = { enable = true },
				closureCaptureHints = { enable = true },
				closureReturnTypeHints = { enable = "always" },
				lifetimeElisionHints = { enable = "skip_trivial" },
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
			cargo = {
				features = "all",
			},
			check = {
				command = "clippy",
			},
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})
