return {
  { "neovim/nvim-lspconfig" },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "onsails/lspkind.nvim",
    },
  },

  -- floating function-signature while typing
  { "ray-x/lsp_signature.nvim", event = "LspAttach" },
}

