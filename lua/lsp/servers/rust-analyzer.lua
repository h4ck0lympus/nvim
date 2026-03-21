local common = require("lsp.common")

return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "Cargo.lock", ".git" },
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  handlers = common.handlers,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
        procMacro = {
          enable = true,
        },
      }
    },
  }
}

