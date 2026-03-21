return {
  -- Comments
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- VSCode-style smart folding (treesitter + LSP providers)
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    },
  },

  -- auto indentation setting detection
  {
	  "NMAC427/guess-indent.nvim",
	  lazy = false,
	  config = function()
		  require("guess-indent").setup{}
	  end,
  },
}
