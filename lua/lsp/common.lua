local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, bufnr)
  end

  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = "rounded" },
  }, bufnr)
end

return M

