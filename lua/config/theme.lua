-- Theme management module
local M = {}

-- List of available themes
M.themes = {
	{ name = "Tokyo Night", colorscheme = "tokyonight" },
	{ name = "Tokyo Night Storm", colorscheme = "tokyonight-storm" },
	{ name = "Tokyo Night Night", colorscheme = "tokyonight-night" },
	{ name = "Tokyo Night Day", colorscheme = "tokyonight-day" },
	{ name = "Catppuccin Mocha", colorscheme = "catppuccin" },
	{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
	{ name = "Catppuccin Frappe", colorscheme = "catppuccin-frappe" },
	{ name = "Catppuccin Latte", colorscheme = "catppuccin-latte" },
	{ name = "Gruvbox", colorscheme = "gruvbox" },
	{ name = "One Dark", colorscheme = "onedark" },
	{ name = "Solarized", colorscheme = "solarized" },
}

-- Default theme
M.current = "tokyonight"

-- Set a theme
function M.set_theme(theme_name)
	local success, err = pcall(vim.cmd, "colorscheme " .. theme_name)
	if success then
		M.current = theme_name
		vim.notify("Theme changed to " .. theme_name, vim.log.levels.INFO)
	else
		vim.notify("Error setting theme: " .. err, vim.log.levels.ERROR)
	end
end

-- Toggle between dark and light themes
function M.toggle_dark_light()
	local current = M.current
	if current:find("latte") or current:find("day") then
		-- Currently using a light theme, switch to dark
		if current:find("catppuccin") then
			M.set_theme("catppuccin-mocha")
		elseif current:find("tokyonight") then
			M.set_theme("tokyonight-storm")
		elseif current:find("solarized") then
			-- Set to dark solarized
			require("solarized").setup({ theme = "neo", styles = { dark = true } })
			M.set_theme("solarized")
		else
			-- Default dark theme
			M.set_theme("tokyonight")
		end
	else
		-- Currently using a dark theme, switch to light
		if current:find("catppuccin") then
			M.set_theme("catppuccin-latte")
		elseif current:find("tokyonight") then
			M.set_theme("tokyonight-day")
		elseif current:find("solarized") then
			-- Set to light solarized
			require("solarized").setup({ theme = "neo", styles = { dark = false } })
			M.set_theme("solarized")
		else
			-- Default light theme
			M.set_theme("tokyonight-day")
		end
	end
end

-- Create a theme picker using Telescope
function M.theme_picker()
	local themes = M.themes

	-- Check if Telescope is available
	local has_telescope, telescope = pcall(require, "telescope.builtin")
	if not has_telescope then
		vim.notify("Telescope is required for theme picker", vim.log.levels.ERROR)
		return
	end

	-- Create a list of theme names for Telescope
	local theme_names = {}
	for _, theme in ipairs(themes) do
		table.insert(theme_names, theme.name)
	end

	-- Launch Telescope selector
	vim.ui.select(theme_names, {
		prompt = "Select Theme",
	}, function(selected)
		if not selected then
			return
		end

		-- Find and apply the selected theme
		for _, theme in ipairs(themes) do
			if theme.name == selected then
				M.set_theme(theme.colorscheme)
				break
			end
		end
	end)
end

-- Initialize with the default theme
function M.init()
	-- Apply the default theme on startup
	M.set_theme(M.current)
end

-- Call it immediately when the module is loaded
M.init()

return M
