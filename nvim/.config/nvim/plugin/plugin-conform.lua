require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		["*"] = { "trim_whitespace", "trim_newlines" },
	},

	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},

	default_format_opts = {
		lsp_format = "fallback",
	},
})
