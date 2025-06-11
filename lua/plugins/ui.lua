return {
  -- All your colorschemes
  { "catppuccin/nvim", name = "catppuccin", enabled = true, priority = 1000 },
  { "blazkowolf/gruber-darker.nvim", name="gruber-darker", enabled = true },
  { "projekt0n/github-nvim-theme", name = "github-theme" },

  -- Colorscheme setup
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 1000,
    config = function()
      local colorscheme = "gruber-darker"
      
      local success, _ = pcall(vim.api.nvim_command, "colorscheme " .. colorscheme)
      if not success then
        vim.notify("Colorscheme " .. colorscheme .. " not found!")
        return
      else
        -- Catppuccin settings
        if colorscheme:find("^catppuccin") ~= nil then
          vim.g.catpuccin_flavor = "mocha"
          require("catppuccin").setup({
            transparent_background = false,
            term_colors = false,
            integrations = {
              treesitter = true,
              native_lsp = { enabled = true },
              cmp = true,
              gitsigns = true,
              telescope = true,
              barbar = true,
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

        if colorscheme:find("^gruber") ~= nil then
	 require("gruber-darker").setup({
	  bold = true,
	  invert = {
	    signs = false,
	    tabline = false,
	    visual = false,
	  },
	  italic = {
	    strings = false,
	    comments = false,
	    operators = false,
	    folds = false,
	  },
	  undercurl = true,
	  underline = true,
	})
      end
			end
      
      vim.api.nvim_command("colorscheme " .. colorscheme)
      vim.cmd("highlight Normal ctermbg=NONE guiBG=None")
    end,
  },

  -- Status line
  {
    "beauwilliams/statusline.lua",
    config = function()
      require("statusline")
    end,
  },

  -- Tab bar
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
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
}
