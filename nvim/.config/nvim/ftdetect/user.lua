local ft_overrides = {
	["yaml.ansible"] = "*/ansible/*/[^.]*.yml",
	ansible_hosts = "*/ansible/*/hosts",
	puppet = "*/manifests/*.pp",
	wla_dx = { "*/pce/*/*.asm", "*/pce/*/*.inc" },
}

for filetype, pattern in pairs(ft_overrides) do
	AutoCmd({ "BufNewFile", "BufRead" }, {
		pattern = pattern,
		callback = function()
			OptLocal.ft = filetype
		end,
	})
end
