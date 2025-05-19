require("plugins")
require("lsp")
require("keybindings")
require("options")

-- vim.cmd("set autoread");
-- vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")
-- vim.cmd("autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None")


-- if vim.fn.expand('%') ~= '' then
--     vim.cmd([[
--       augroup remember_folds
--         autocmd!
--         autocmd BufWinLeave * mkview
--         autocmd BufWinEnter * silent! loadview
--       augroup END
--     ]])
-- end
