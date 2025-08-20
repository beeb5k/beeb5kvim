return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            hint = {
                enabled = false,
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
                disable = { "missing-fields" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    -- '${3rd}/luv/library',
                    -- unpack(vim.api.nvim_get_runtime_file("", true)),
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
}
