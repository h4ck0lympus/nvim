vim.g.mapleader = " "
vim.g.maplocalleader = " "
local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

-- move lines
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts)

-- telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gdp", ":Lspsaga peek_definition<CR>", opts)
        vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>gk", ":Lspsaga signature_help<CR>", opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<CR>", opts)
        vim.keymap.set("n", "<leader>co", ":Lspsaga outline<CR>", opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end,
})

-- file manager - dired
vim.keymap.set("n", "<leader>e", ":Dired<CR>", opts)

-- split
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>hh", ":split<CR>", opts)

vim.keymap.set("n", "<leader>F", ":Format<CR>", opts)

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
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

vim.keymap.set("n", "<leader>bf", ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', opts)

-- Close buffer
vim.keymap.set("n", "<C-g>", "<Cmd>BufferClose<CR>", opts)
