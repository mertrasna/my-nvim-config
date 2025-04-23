return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup()
      
      -- Enable comment string based on file type
      -- This allows jsx/tsx comments to work correctly
      require('Comment.ft').set('javascriptreact', '{/* %s */}')
      require('Comment.ft').set('typescriptreact', '{/* %s */}')
    end,
  },
}
