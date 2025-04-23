return {
  -- Tokyo Night colorscheme
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Load before all other plugins
    config = function()
      -- Configure the colorscheme
      require("tokyonight").setup({
        style = "storm", -- Options: storm, moon, night, day
        transparent = false,
        terminal_colors = true,
      })
      
      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
