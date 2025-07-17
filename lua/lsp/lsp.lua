vim.g.completeopt = "menu,menuone,noselect"
local cmp     = require("cmp")
local lspkind = require("lspkind")

local autocomplete_enabled = true
function ToggleAutocomplete()
  autocomplete_enabled = not autocomplete_enabled

  cmp.setup({
    completion = {
      autocomplete = autocomplete_enabled
        and { require("cmp.types").cmp.TriggerEvent.TextChanged }
        or false,
    },
  })

  vim.notify("Autocomplete " .. (autocomplete_enabled and "Enabled" or "Disabled"))
end

-- keybinding to toggle autocomplete
vim.keymap.set("n", "<leader>ac", ToggleAutocomplete, { desc = "Toggle Auto Completion" })

cmp.setup({
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
  },
  preselect  = cmp.PreselectMode.None,

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
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

