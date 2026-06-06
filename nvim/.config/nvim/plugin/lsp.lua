-- Language servers
local servers = {
	ansiblels = {},
	awkls = {},
	bashls = {},
	gopls = {},
	lua_ls = {},
	pylsp = {},
	rust_analyzer = {},
	terraformls = {},
	vimls = {},
	yamlls = {},
}

-- Enable language servers w/ additional capabilities from cmp
for server, config in pairs(servers) do
	config["capabilities"] = require("cmp_nvim_lsp").default_capabilities()

	Lsp.config(server, config)
	Lsp.enable(server)
end
