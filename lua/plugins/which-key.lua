return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local which_key = require("which-key")
			which_key.setup({
				plugins = {
					marks = true,
					registers = true,
					spelling = {
						enabled = true,
						suggestions = 20,
					},
					presets = {
						operators = true,
						motions = true,
						text_objects = true,
						windows = true,
						nav = true,
						z = true,
						g = true,
					},
				},
				window = {
					border = "single",
					position = "bottom",
					padding = { 2, 2, 2, 2 },
				},
				ignore_missing = false,
				show_help = true,
				triggers = "auto",
			})
			-- Register key groups
			which_key.register({
				["<leader>f"] = { name = "Format/Find" },
				["<leader>ff"] = { desc = "Find files" },
				["<leader>fr"] = { desc = "Find recent files" },
				["<leader>fs"] = { desc = "Find string" },
				["<leader>fc"] = { desc = "Find word under cursor" },
				["<leader>fb"] = { desc = "Find buffers" },
				["<leader>fh"] = { desc = "Find help" },
				["<leader>g"] = { name = "Git" },
				["<leader>l"] = { name = "LSP" },
				["<leader>t"] = { name = "Terminal/Theme" },
				["<leader>tv"] = { desc = "Terminal Vertical Split" },
				["<leader>th"] = { desc = "Terminal Horizontal Split" },
				["<leader>tt"] = { desc = "Terminal Tab" },
				["<leader>tc"] = { desc = "Terminal Close" },
				["<leader>ts"] = { desc = "Select Theme" },
				["<leader>tm"] = { desc = "Toggle Dark/Light Mode" },
				["<leader>?"] = { desc = "Keybindings Help" },
			})
		end,
	},
}
