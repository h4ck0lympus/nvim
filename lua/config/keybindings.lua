local opts = { noremap = true, silent = true }

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- lsp keybindings in lsp/init.lua
-- file manager - dired
vim.keymap.set("n", "<leader>e", ":Dired<CR>", opts)

-- split
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>hh", ":split<CR>", opts)

-- format
vim.keymap.set("n", "<leader>F", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", opts)
vim.keymap.set("n", "<C-Up>", ":resize +3<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -3<CR>", opts)

-- Move to previous/next
vim.keymap.set("n", "<Tab>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
for i = 1, 9 do
  vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
end
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)


vim.keymap.set("n", "<leader>bf", ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', opts)

-- Close buffer
vim.keymap.set("n", "<C-g>", "<Cmd>BufferClose<CR>", opts)
