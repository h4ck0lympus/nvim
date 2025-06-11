return {
  -- manage language-servers
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "clangd", "pyright", "lua_ls" },
      automatic_installation = true,
    },
  },

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

