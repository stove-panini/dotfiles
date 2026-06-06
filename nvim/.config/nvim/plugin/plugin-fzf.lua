-- Allow fzf window to be closed with Esc
AutoCmd("FileType", {
	pattern = "fzf",
	callback = function()
		vim.keymap.set("t", "<ESC>", "<C-c>", { buffer = true })
	end,
})

-- Start at project root (w/ vim-rooter)
Map("n", "<leader>o", Cmd.Files)

-- Start in current directory
Map("n", "<leader>O", function()
	Cmd.Files(vim.fn.expand("%:p:h"))
end)

-- Start in ~/Projects
Map("n", "<leader><A-o>", function()
	Cmd.Files(vim.fn.expand("~/Projects"))
end)

-- Ripgrep
Map("n", "<leader>f", Cmd.Rg)

-- Keybinds for opening files from fzf window
G.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-x"] = "split",
	["ctrl-v"] = "vsplit",
}

-- Initialize configuration dictionary
G.fzf_vim = {}
