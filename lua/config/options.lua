-- UI Settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.termguicolors = true   -- True color support
vim.opt.signcolumn = "yes"     -- Always show the signcolumn
vim.opt.cursorline = true      -- Highlight current line
vim.opt.showmode = false       -- Don't show mode (will use statusline)
vim.opt.wrap = false           -- Don't wrap lines
vim.opt.scrolloff = 8          -- Lines of context

-- Tabs & Indentation
vim.opt.tabstop = 2            -- 2 spaces for tabs
vim.opt.shiftwidth = 2         -- 2 spaces for indentation
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart autoindent when starting a new line

-- Search
vim.opt.ignorecase = true      -- Ignore case in search patterns
vim.opt.smartcase = true       -- Override ignorecase if search has uppercase
vim.opt.hlsearch = true        -- Highlight search results
vim.opt.incsearch = true       -- Show matches as you type

-- Files
vim.opt.backup = false         -- Don't create backup files
vim.opt.swapfile = false       -- Don't create swap files
vim.opt.undofile = true        -- Persistent undo history
vim.opt.hidden = true          -- Allow switching buffers without saving

-- Behavior
vim.opt.mouse = "a"            -- Enable mouse in all modes
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.updatetime = 300       -- Faster completion
vim.opt.timeoutlen = 500       -- Faster key sequence completion
vim.opt.completeopt = { "menuone", "noselect" } -- Better completion experience

return {}
