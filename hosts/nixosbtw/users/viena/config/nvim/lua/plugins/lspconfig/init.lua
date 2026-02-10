require("plugins.lspconfig.lua")
require("plugins.lspconfig.docker")
require("plugins.lspconfig.nix")
require("plugins.lspconfig.cpp")

vim.diagnostic.config({
	virtual_text = true,
})
