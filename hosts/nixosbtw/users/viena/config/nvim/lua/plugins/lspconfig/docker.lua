vim.lsp.config["docker_lsp"] = {
	cmd = { "docker-language-server", "start", "--stdio" },
	filetypes = { "dockerfile", "yaml" },
	get_language_id = function(_, ftype)
		if ftype:lower():find("ya?ml") then
			return "dockercompose"
		else
			return ftype
		end
	end,
}

vim.lsp.enable("docker_lsp")
