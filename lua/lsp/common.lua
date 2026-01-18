local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
  -- inlay hints 
  -- disable name hinting
  -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

  -- lsp-signature
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = "rounded" },
  }, bufnr)
end

return M

