local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("treesitter-config")
        end,
        event = { "BufWinEnter" },
    },

    {
        "numToStr/Comment.nvim",
        lazy = false,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-lua/plenary.nvim",
    },

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ",
        "rafamadriz/friendly-snippets",
    },

    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "X3eRo0/dired.nvim",
        dependencies = "MunifTanjim/nui.nvim",
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },

    {
        "mhartington/formatter.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("formatter-config")
        end,
    },

    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = true
        end,
        opts = {
            animation = false,
            insert_at_start = false,
        },
        lazy = false,
    },

    {
        "j-morano/buffer_manager.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "beauwilliams/statusline.lua",
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- colorschemes
    {
        "ishan9299/modus-theme-vim",
        enabled = true,
        priority = 1000,
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        enabled = true,
        priority = 1000,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = true,
        priority = 1000,
    },

    {
        "scottmckendry/cyberdream.nvim",
        enabled = true,
        priority = 1000,
    },
    {
        "helbing/aura.nvim",
        enabled = true,
        priority = 1000,
    },
    {
        "blazkowolf/gruber-darker.nvim",
        enabled = true,
    },
    {
        "olivercederborg/poimandres.nvim",
        enabled = true,
    },
    {
        "ramojus/mellifluous.nvim",
        enabled = true,
    },

    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
    },

    {
        "savq/melange-nvim"
    }
}

local opts = {}

require("lazy").setup(plugins, opts)

-- require("move").setup({
--     line = {
--         enable = true, -- Enables line movement
--         indent = true, -- Toggles indentation
--     },
--     block = {
--         enable = true, -- Enables block movement
--         indent = true, -- Toggles indentation
--     },
--     word = {
--         enable = true, -- Enables word movement
--     },
--     char = {
--         enable = true, -- Enables char movement
--     },
-- })
require("lspsaga").setup({
    ui = {
        code_action = "",
    },
    lightbulb = {
        enable = true,
    },
})

require("dired").setup({
    path_separator = "/",
    show_banner = false,
    show_hidden = true,
    show_dot_dirs = true,
    show_colors = true,
})
require("Comment").setup(opts)
require("barbar").setup(opts)
require("buffer_manager").setup(opts)

