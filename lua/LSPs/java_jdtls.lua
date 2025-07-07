local M = {}

function M.setupJDTLS()
    vim.cmd([[packadd nvim-jdtls]])
    local ok, jdtls = pcall(require, "jdtls")
    if not ok then
        vim.notify("jdtls could not be loaded")
        return
    end

    local jdtls_path = vim.fn.exepath("jdtls")
    local jdtls_dir = string.gsub(jdtls_path, "/bin/jdtls$", "/")

    local config_dir = vim.fn.stdpath("cache") .. "/jdtls/config_linux"
    vim.fn.mkdir(config_dir, "p")

    local operative_system
    if vim.fn.has("linux") == 1 then
        operative_system = "linux"
    elseif vim.fn.has("win32") == 1 then
        operative_system = "win"
    elseif vim.fn.has("macunix") == 1 then
        operative_system = "mac"
    end

    if vim.fn.empty(vim.fn.glob(config_dir .. "/*")) > 0 then
        local original_config = jdtls_dir .. "share/java/jdtls/config_" .. operative_system .. "/*"
        vim.cmd("silent !cp -r " .. original_config .. " " .. config_dir)
    end

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = vim.loop.os_homedir() .. "/.cache/jdtls/workspace/" .. project_name
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
            vim.fn.glob(jdtls_dir .. "share/java/jdtls" .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
            "-configuration",
            config_dir,
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
