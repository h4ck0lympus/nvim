vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- search and UI
vim.o.hlsearch = false
vim.wo.number = true
vim.cmd("set relativenumber")
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.undofile = true
vim.wo.signcolumn = "yes"
vim.o.scrolloff = 3
vim.o.termguicolors = true

-- indentation
vim.o.tabstop = 8 -- number of spaces that a <Tab> in the file counts for
vim.o.softtabstop = 4 -- number of spaces that a tab counts for
vim.o.shiftwidth = 4 
-- vim.bo.shiftwidth = 4
-- vim.o.autoindent = true
-- vim.bo.autoindent = true
-- vim.o.expandtab = true
-- vim.bo.expandtab = true

-- status and timing
vim.o.showtabline = 3
vim.o.laststatus = 1
vim.o.updatetime = 100
vim.o.timeoutlen = 300

-- auto read files
vim.cmd("set autoread")
vim.cmd("filetype plugin indent on")

-- disable F1 help
vim.cmd("nmap <F1> :echo<CR>")
vim.cmd("imap <F1> <C-o>:echo<CR>")
