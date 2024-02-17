local colorscheme = "catppuccin"

local success, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
if not success then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
    return
else
    if colorscheme:find("^modus") ~= nil then
        vim.g.modus_moody_enable = true
        vim.g.modus_yellow_comments = true
        vim.g.modus_green_strings = true
        vim.g.modus_faint_syntax = true
        vim.g.modus_cursorline_intense = true
        vim.g.modus_termtrans_enable = true
        vim.g.modus_dim_inactive_window = true
    end

    if colorscheme:find("^catppuccin") ~= nil then
        vim.g.catpuccin_flavor = "mocha"
        require("catppuccin").setup({
            transparent_background = false,
            term_colors = false,
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = {},
                        hints = {},
                        warnings = {},
                        information = {},
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                },
                coc_nvim = false,
                lsp_trouble = false,
                cmp = true,
                lsp_saga = false,
                gitgutter = false,
                gitsigns = true,
                telescope = true,
                nvimtree = {
                    enabled = true,
                    show_root = false,
                    transparent_panel = false,
                },
                neotree = {
                    enabled = false,
                    show_root = false,
                    transparent_panel = false,
                },
                which_key = false,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                dashboard = true,
                neogit = false,
                vim_sneak = false,
                fern = false,
                barbar = false,
                bufferline = true,
                markdown = true,
                lightspeed = false,
                ts_rainbow = false,
                hop = false,
                notify = true,
                telekasten = true,
                symbols_outline = true,
            },
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
            },
        })
    end
    if colorscheme:find("cyberdream") ~= nil then
        require("cyberdream").setup({
            theme = {
                colors = {
                    bg = "#000000",
                },
            },
        })
    end
end
vim.api.nvim_command("colorscheme " .. colorscheme)
