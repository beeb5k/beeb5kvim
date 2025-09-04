return {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", "MakeFile" },
    settings = {
        clangd = {
            InlayHints = {
                ParameterNames = true,
                TypeHints = true,
                ChainedCalls = true,
            },
            fallbackFlags = { "-std=c17" },
        },
    },
}
