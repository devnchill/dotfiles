-- Define the available themes and their corresponding configurations
local themes = {
	{ name = "everforest", config = nil },
	{ name = "catppuccin", config = nil },
	{ name = "onedark", config = nil },
	{ name = "tokyonight", config = nil },
}
local current_theme_index = 1

-- Function to toggle between themes
function _G.toggle_theme()
	current_theme_index = current_theme_index % #themes + 1
	local theme = themes[current_theme_index]
	if theme.config then
		theme.config()
	end
	vim.cmd("colorscheme " .. theme.name)
	vim.notify("Switched to " .. theme.name .. " theme")
end

-- Map the key combination <leader>gg to toggle themes
vim.api.nvim_set_keymap("n", "<leader>gg", ":lua toggle_theme()<CR>", { noremap = true, silent = true })
