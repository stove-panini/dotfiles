require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "srcery",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		--lualine_z = { "location" },
		lualine_z = {
			-- Display virtual column in the location bar so the value of tabstop counts
			-- toward columns (otherwise, a tab always = one column no matter what)
			function()
				local line = vim.fn.line(".")
				local col = vim.fn.virtcol(".")
				return string.format("%3d:%-2d", line, col)
			end,
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
