local common = require("lsp.common")

return {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    handlers = common.handlers,
    cmd = {
        "clangd",
    },
    filetypes = { "c", "cc", "cpp", "h", "hpp", "ixx", "cppm", "inl" },
    root_markers = { ".clang-format", ".git", "compile_commands.json", "CMakeLists.txt", "Makefile" },
}

