return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      
      treesitter.setup({
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { 
          "c", "lua", "vim", "vimdoc", "query",
          -- add languages you use
          "javascript", "typescript", "html", "css", "json", "python",
          "bash", "markdown", "markdown_inline"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        
        -- Indentation based on treesitter
        indent = { enable = true },
        
        -- Automatically close and rename HTML tags
        autotag = { enable = true },
      })
    end,
  },
}
