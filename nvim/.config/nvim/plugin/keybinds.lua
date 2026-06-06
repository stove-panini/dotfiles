-- Set leader key to space
Map("n", "<Space>", "<nop>")
G.mapleader = " "

-- Split control
Map("n", "<C-w>n", Cmd.new)
Map("n", "<C-w>v", Cmd.vnew)
Map("n", "<C-w>N", Cmd.split)
Map("n", "<C-w>V", Cmd.vsplit)

-- Tab control
Map("n", "tc", Cmd.tabnew)
Map("n", "tn", Cmd.tabnext)
Map("n", "tN", Cmd.tabprev)

-- Moving lines
-- ref: https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
Map("n", "<A-j>", ":m .+1<CR>==")
Map("n", "<A-k>", ":m .-2<CR>==")

-- Clear search results with Enter
Map("n", "<leader><CR>", Cmd.nohlsearch)

-- Reload nvim config
Map("n", "<leader><C-r>", function()
	Cmd.source(vim.env.MYVIMRC)
	print("Reloaded" .. vim.env.MYVIMRC)
end)

-- Open terminal in a split
Map("n", "<leader>t", function()
	Cmd.vnew("term://%:p:h//bash")
end)
Map("n", "<leader>T", function()
	Cmd.new("term://%:p:h//bash")
end)

-- Return to normal mode in termal with Esc
Map("t", "<Esc>", "<C-\\><C-n>")

-- Linter messages
Map("n", "<Tab>", vim.diagnostic.open_float)
Map("n", "<leader>l", vim.diagnostic.setloclist)
Map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
Map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

-- Only map LSP keybinds when a language server is available
vim.api.nvim_create_autocmd("LspAttach", {
	pattern = "*",
	callback = function()
		Map("n", "gd", Lsp.buf.definition, { buffer = true })
		Map("n", "gD", Lsp.buf.declaration, { buffer = true })
		Map("n", "gi", Lsp.buf.implementation, { buffer = true })
		Map("n", "gt", Lsp.buf.type_definition, { buffer = true })
		Map("n", "gr", Lsp.buf.references, { buffer = true })
		Map("n", "K", Lsp.buf.hover, { buffer = true })
		Map("n", "<C-n>", Lsp.buf.rename, { buffer = true })
		Map("n", "<C-f>", Lsp.buf.format, { buffer = true })
	end,
})
