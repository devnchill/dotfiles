return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require("illuminate").configure({})

		-- Apply highlight settings after colorscheme
		vim.defer_fn(function()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3e4451", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3e4451", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3e4451", underline = true })
			-- Add enlarging effect by using the same highlighting as 'CursorLine' or a custom highlight group
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#ffffff", bold = true })
		end, 0)
	end,
}
