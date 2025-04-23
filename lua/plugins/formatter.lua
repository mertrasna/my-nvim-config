return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
    config = function()
      require("conform").setup({
        -- Define formatters
        formatters_by_ft = {
          lua = { "stylua" },
          -- Web development
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          -- Python
          python = { "isort", "black" },
          -- Go
          go = { "gofmt" },
          -- Rust
          rust = { "rustfmt" },
          -- Shell
          sh = { "shfmt" },
        },
        
        -- Set up format-on-save
        format_on_save = function(bufnr)
          -- Don't auto format on save for certain filetypes
          local ignore_filetypes = { "sql", "text" }
          if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
          end
          
          -- Only auto format if we're not in insert mode
          local mode = vim.api.nvim_get_mode().mode
          if mode == "i" then 
            return 
          end
          
          return { timeout_ms = 500, lsp_fallback = true }
        end,
        
        -- Customize formatters
        formatters = {
          prettier = {
            prepend_args = { "--print-width", "100" },
          },
          black = {
            prepend_args = { "--line-length", "88" },
          },
          shfmt = {
            prepend_args = { "-i", "2" },
          },
        },
      })
      
      -- Register which-key group
      require("which-key").register({
        ["<leader>f"] = { name = "+format" },
      })
    end,
  },
}
