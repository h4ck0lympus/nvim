return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufWinEnter" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "cpp", "python", "bash", "lua", "vimdoc" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
