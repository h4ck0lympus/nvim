local signs = { Error = "", Warn = "", Hint = "󰌵", Info = " " }
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = signs.Error,
			[vim.diagnostic.severity.WARN] = signs.Warn,
			[vim.diagnostic.severity.HINT] = signs.Hint,
			[vim.diagnostic.severity.INFO] = signs.Info,
		},
	},
	virtual_text = false,
	update_in_insert = true,
	underline = false,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "none",
		header = "",
		prefix = "",
	},
})
