vim.lsp.config["cpp_lsp"] = {
	cmd = { "clangd" },
	filetypes = { "cpp" },
}

vim.lsp.enable("cpp_lsp")
