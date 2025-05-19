require("lsp/cmp")

local servers = { "lua_ls", "clangd", "pyright", "bashls"}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = servers,
})
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Enable the following language servers
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- override setup defaults
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})

lspconfig.pyright.setup({
    noremap = true,
    silent = true,
    autoSearchPaths = true,
    useLibraryCodeForTypes = true,
    autoImportCompletions = true,
    reportUnusedImport = true,
    typeCheckingMode = "basic",
    reportMissingImports = true,
    reportMissingTypeStubs = false,
})

lspconfig.bacon_ls.setup{}
lspconfig.jdtls.setup{}
