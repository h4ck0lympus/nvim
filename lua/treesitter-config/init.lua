local M = {}

local config = require("nvim-treesitter.configs")

config.setup({
  ensure_installed = { "c", "cpp", "python", "bash", "lua"},
  sync_setup = false,
  auto_install = true,
  highlight = { enable = true },
  indent =  { enable = true },
})
