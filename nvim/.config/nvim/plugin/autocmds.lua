-- Format document before saving
AutoCmd("BufWritePre", {
	pattern = "*",
	callback = function()
		Lsp.buf.format()
	end,
})

-- Terminal
local augroup_terminal = AuGroup("terminal", { clear = true })

local augroup_terminal_commands = {
	{
		event = { "TermOpen", "BufEnter" },
		pattern = "term://*",
		callback = function()
			Cmd.startinsert()
		end,
	},
	{
		event = "TermOpen",
		pattern = "*",
		callback = function()
			OptLocal.number = false
			OptLocal.relativenumber = false
			OptLocal.cursorline = false
		end,
	},
	{
		event = "TermClose",
		pattern = "*",
		callback = function()
			Cmd("bdelete!")
		end,
	},
}

for _, config in ipairs(augroup_terminal_commands) do
	AutoCmd(config.event, {
		group = augroup_terminal,
		pattern = config.pattern,
		callback = config.callback,
	})
end

-- Filetype overrides
local augroup_ft = AuGroup("ft", { clear = true })

local augroup_ft_commands = {
	{
		pattern = "sh",
		callback = function()
			OptLocal.sw = 4
			OptLocal.ts = 4
		end,
	},
	{
		pattern = { "ruby", "yaml", "vim", "terraform" },
		callback = function()
			OptLocal.sw = 2
			OptLocal.ts = 2
		end,
	},
	{
		pattern = "lua",
		callback = function()
			OptLocal.list = false
			OptLocal.expandtab = false
			OptLocal.sw = 2
			OptLocal.ts = 2
		end,
	},
	{
		pattern = { "markdown", "mkd", "text" },
		callback = function()
			OptLocal.wrap = true
			OptLocal.linebreak = true
		end,
	},
	{
		pattern = { "markdown", "mkd" },
		callback = function()
			OptLocal.conceallevel = 2
			OptLocal.modeline = false
		end,
	},
	{
		pattern = "wla_dx",
		callback = function()
			OptLocal.list = false
			OptLocal.expandtab = false
			OptLocal.sw = 8
			OptLocal.ts = 8
		end,
	},
}

for _, config in ipairs(augroup_ft_commands) do
	AutoCmd("FileType", {
		group = augroup_ft,
		pattern = config.pattern,
		callback = config.callback,
	})
end
