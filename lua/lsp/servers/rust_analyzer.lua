local common = require("lsp.common")

return {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    handlers = common.handlers,
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
	  ["rust-analyzer"] = {
	    cargo = {
	      allFeatures = true,
	      loadOutDirsFromCheck = true,
	      runBuildScripts = true,
	    },
	    checkOnSave = true,
	    completion = {
	      addCallArgumentSnippets = true, -- show function arguments when autocompleting
	      addCallParenthesis = true,      -- add `()` after function name
	      postfix = {
		enable = true,                -- enables `.dbg`, `.await`, etc.
	      },
	      snippets = {
		custom = {
		  -- Example: `dbg` snippet
		  ["dbg"] = {
		    prefix = "dbg",
		    body = "dbg!($0);",
		    description = "Insert debug macro",
		    scope = "expr",
		  }
		}
	      }
	    },
	    diagnostics = {
	      enable = true,
	      experimental = {
		enable = true,
	      },
	    },
	    inlayHints = {
	      chainingHints = true,
	      parameterHints = true,
	      typeHints = true,
	      lifetimeElisionHints = {
		enable = true,
		useParameterNames = true,
	      },
	    },
	    lens = {
	      enable = true, -- show `run`, `test` code lens
	    },
	    imports = {
	      granularity = {
		group = "module",
	      },
	      prefix = "self",
	    },
	    procMacro = {
	      enable = true,
	    },
	  },
	},
}

