function RunPythonProgram()
	-- Save the current file
	vim.cmd("write")

	-- Get the full path of the current file
	local current_file_with_ext = vim.fn.expand("%:p")
	local current_dir = vim.fn.expand("%:p:h")

	-- Command to run the Python file
	local cmd = "cd " .. current_dir .. " && python " .. current_file_with_ext

	-- Use ToggleTerm to open a terminal and send the command
	local Terminal = require("toggleterm.terminal").Terminal
	local python_program_terminal = Terminal:new({
		cmd = cmd,
		direction = "float",
		close_on_exit = false,
		on_open = function(term)
			vim.cmd("startinsert!")
		end,
	})
	python_program_terminal:toggle()
end

-- Map the function to <Leader>rpy
vim.api.nvim_set_keymap("n", "<Leader>rpy", ":lua RunPythonProgram()<CR>", { noremap = true, silent = true })
