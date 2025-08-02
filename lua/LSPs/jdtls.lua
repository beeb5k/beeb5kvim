local M = {}

function M.setupJDTLS()
	local ok, jdtls = pcall(require, "jdtls")
	if not ok then
		vim.notify("jdtls could not be loaded")
		return
	end

	local operative_system
	if vim.fn.has("linux") == 1 then
		operative_system = "linux"
	elseif vim.fn.has("win32") == 1 then
		operative_system = "win"
	elseif vim.fn.has("macunix") == 1 then
		operative_system = "mac"
	end

	local mason_registry = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
	local jdtls_launcher = vim.fn.glob(mason_registry .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	local jdtls_config = mason_registry .. "/config_" .. operative_system

	-- check
	if jdtls_launcher == "" then
		vim.notify("Could not find org.eclipse.equinox.launcher jar", vim.log.levels.ERROR)
		return
	end

	-- cache? config? whatever
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	-- local workspace_dir = vim.loop.os_homedir() .. "/.cache/jdtls/workspace/" .. project_name
	local proot = vim.fs.root(0, {
		".git",
		"build.gradle",
		"pom.xml",
		"build.xml",
		"pom.xml",
		"java.iml",
		"settings.gradle",
		"settings.gradle.kts",
	})

	local workspace_dir
	if not proot then
		workspace_dir = vim.fn.getcwd() .. "/.jdtls"
	else
		workspace_dir = proot .. "/.jdtls"
	end

	vim.fn.mkdir(workspace_dir, "p")
	local extendedClientCapabilities = jdtls.extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

	local config = {
		cmd = {
			"java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			-- "-javaagent:" .. jdtls_path .. "/lombok.jar", -- some other day gng
			"-jar",
			jdtls_launcher,
			"-configuration",
			jdtls_config,
			"-data",
			workspace_dir,
		},

		root_dir = vim.fs.root(0, {
			".git",
			"build.gradle",
			"pom.xml",
			"build.xml",
			"pom.xml",
			"java.iml",
			"settings.gradle",
			"settings.gradle.kts",
		}),

		filetypes = { "java" },

		settings = {
			java = {
				configuration = {
					updateBuildConfiguration = "interactive",
				},
				eclipse = {
					downloadSources = true,
				},
				format = {
					enabled = true,
				},
				implementationsCodeLens = { enabled = true },
				inlayHints = {
					parameterNames = {
						enabled = "all",
					},
				},
				maven = {
					downloadSources = true,
				},
				references = {
					includeDecompiledSources = true,
				},
				referencesCodeLens = {
					enabled = true,
				},
			},
			redhat = {
				telemetry = { enabled = false },
			},
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
		},

		-- init_options = {},
	}

	require("jdtls").start_or_attach(config)
end

return M
