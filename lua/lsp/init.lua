require("lsp.lsp")
local common = require("lsp.common")

-- server config
local servers = {"pyright", "clangd", "lua_ls", "rust_analyzer"}

for _, server in ipairs(servers) do
  local ok, config = pcall(require, "lsp.servers." .. server)
  if ok then
    vim.lsp.config[server] = config
    vim.lsp.enable(server)
  else
    vim.notify("LSP config for " .. server .. " not found", vim.log.levels.WARN)
  end
end

-- lsp lsp_signature
local cfg = {
  floating_window_off_x = 5, -- adjust float windows x position.
  floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
    local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
    local pumheight = vim.o.pumheight
    local winline = vim.fn.winline() -- line number in the window
    local winheight = vim.fn.winheight(0)

    -- window top
    if winline - 1 < pumheight then
      return pumheight
    end

    -- window bottom
    if winheight - winline < pumheight then
      return -pumheight
    end
    return 0
  end,
}
require("lsp_signature").setup(cfg)

-- keybindings
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
