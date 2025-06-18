local common = require("lsp.common")

return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = {".git", "Cargo.toml"},
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  handlers = common.handlers,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      completion = {
        addCallArgumentSnippets = true,
        addCallParenthesis = true,
      },
      diagnostics = {
        enable = true,
        disabled = { "unresolved-import" },
      },
    },
  },
}

