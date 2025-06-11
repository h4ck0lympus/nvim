vim.g.completeopt = "menu,menuone,noselect"
local cmp     = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  completion = { autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged } },
  preselect  = cmp.PreselectMode.None,

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        cmp.complete()
      end
    end, { "i", "s", "c" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, { "i", "s", "c" }),

    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    -- arrow keys focus the list only when visible
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, { "i", "c" }),

    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end, { "i", "c" }),

    ["<C-Space>"] = cmp.mapping(function()
      -- still handy: open or cycle when you prefer Ctrl-Space
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        cmp.complete()
      end
    end, { "i", "c" }),

    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs( 4),
    ["<C-e>"] = cmp.mapping.abort(),
  },

  snippet = { expand = function(a) vim.fn["vsnip#anonymous"](a.body) end },
  sources  = {
    { name = "nvim_lsp" }, { name = "path" },
    { name = "buffer"   }, { name = "vsnip" },
  },
  formatting = {
    format = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 }),
  },
})

