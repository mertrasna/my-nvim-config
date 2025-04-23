-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Stay in indent mode when indenting
vim.keymap.set("v", "<", "<gv", { desc = "Unindent line" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Clear highlights
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

-- Buffers
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Quick save
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })

-- Better paste
vim.keymap.set("v", "p", '"_dP', { desc = "Better paste" })

-- Terminal mappings
-- Open terminal in vertical split
vim.keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })
-- Open terminal in horizontal split
vim.keymap.set("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Open terminal in horizontal split" })
-- Open terminal in new tab
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew | terminal<CR>", { desc = "Open terminal in new tab" })
-- Escape terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Close terminal (while in terminal mode)
vim.keymap.set("t", "<C-d>", "<C-\\><C-n>:bd!<CR>", { desc = "Close terminal" })
-- Close terminal (while in normal mode in a terminal buffer)
vim.keymap.set("n", "<leader>tc", ":bd!<CR>", { desc = "Close terminal" })

-- Dashboard
vim.keymap.set("n", "<leader>d", ":Alpha<CR>", { desc = "Open Dashboard" })

-- Open help file
vim.keymap.set("n", "<leader>?", ":e ~/.config/nvim/help.md<CR>", { desc = "Open Keybindings Help" })
-- Theme keymaps
vim.keymap.set("n", "<leader>ts", function()
	require("config.theme").theme_picker()
end, { desc = "Select Theme" })
vim.keymap.set("n", "<leader>tm", function()
	require("config.theme").toggle_dark_light()
end, { desc = "Toggle Dark/Light Mode" })

return {}
