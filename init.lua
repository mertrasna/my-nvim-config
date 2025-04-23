-- Set leader key (needs to be set before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration
require("config")

-- Initialize lazy.nvim with plugins
require("lazy").setup({
	spec = { import = "plugins" },
	defaults = { lazy = false },
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true },
	change_detection = { notify = false },
})

-- Ensure colorscheme is applied
vim.cmd("colorscheme tokyonight")
