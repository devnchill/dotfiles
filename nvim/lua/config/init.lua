local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.runpython")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.runcompetive")
require("config.theme_toggle")
require("config.runc")
require("config.runcpp")
require("config.helpers")
require("config.runjs")
local plugins = "plugins"

local opts = {
	defaults = {
		lazy = true,
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
}

require("lazy").setup(plugins, opts)

-- Set the default colorscheme
-- vim.cmd("colorscheme tokyonight-storm")
vim.cmd("colorscheme everforest")

-- Set highlight for comments to soft blue
vim.api.nvim_set_hl(0, "Comment", { fg = "#a89984", italic = true })
