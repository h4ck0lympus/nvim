-- space is leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.hlsearch = false -- set highlight on search
vim.wo.number = true -- make line numbers default
vim.o.mouse = "a" -- enable mouse
vim.o.clipboard = "unnamedplus" -- sync clipboard with the system
vim.o.breakindent = true
vim.o.undofile = true
vim.wo.signcolumn = "yes" -- signcolumn on by default
vim.updatetime = 100
vim.o.scrolloff = 3
vim.o.timeoutlen = 300
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.showtabline = 3
vim.o.laststatus = 1
vim.cmd("filetype plugin indent on")
vim.cmd("nmap <F1> :echo<CR>")
vim.cmd("imap <F1> <C-o>:echo<CR>")
vim.cmd("set relativenumber")
vim.cmd("set autoread")

require("colorscheme")
