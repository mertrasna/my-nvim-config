return {
	-- Tokyo Night theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm", -- Options: storm, moon, night, day
				transparent = false,
				terminal_colors = true,
			})
		end,
	},

	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
				background = { light = "latte", dark = "mocha" },
				transparent_background = false,
			})
		end,
	},

	-- Gruvbox theme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "medium", -- Options: soft, medium, hard
				transparent_mode = false,
			})
		end,
	},

	-- One Dark theme
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "dark", -- Options: dark, darker, cool, deep, warm, warmer
			})
		end,
	},

	-- Solarized theme
	{
		"maxmx03/solarized.nvim",
		priority = 1000,
		config = function()
			require("solarized").setup({
				theme = "neo", -- Options: neo, default
				transparent = false,
			})
		end,
	},
}
