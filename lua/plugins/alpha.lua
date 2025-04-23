return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Change the NEOVIM header to BATMERT
			dashboard.section.header.val = {
				"                                                     ",
				"  ██████   █████  ████████ ███    ███ ███████ ██████  ████████ ",
				"  ██   ██ ██   ██    ██    ████  ████ ██      ██   ██    ██    ",
				"  ██████  ███████    ██    ██ ████ ██ █████   ██████     ██    ",
				"  ██   ██ ██   ██    ██    ██  ██  ██ ██      ██   ██    ██    ",
				"  ██████  ██   ██    ██    ██      ██ ███████ ██   ██    ██    ",
				"                                                     ",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
				dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
				dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
				dashboard.button("h", "  Help & Keybindings", ":e ~/.config/nvim/help.md <CR>"),
				dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
				dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
			}

			-- Set footer
			local function footer()
				local version = vim.version()
				local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
				local datetime = os.date("%Y/%m/%d %H:%M:%S")
				return "Neovim " .. print_version .. "  " .. datetime
			end

			dashboard.section.footer.val = footer()

			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "Include"
			dashboard.section.buttons.opts.hl = "Keyword"

			dashboard.opts.opts.noautocmd = true

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])

			-- Create a help.md file with keybinding documentation if it doesn't exist
			local help_file = vim.fn.stdpath("config") .. "/help.md"
			if vim.fn.filereadable(help_file) == 0 then
				local file = io.open(help_file, "w")
				if file then
					file:write([[# BATMERT Neovim Keybindings

## General
| Key         | Action                      |
|-------------|----------------------------|
| `<Space>`   | Leader key                 |
| `<Space>h`  | Clear search highlights    |
| `<Space>w`  | Save file                  |
| `<Space>d`  | Open dashboard             |

## Navigation
| Key         | Action                      |
|-------------|----------------------------|
| `<Ctrl-h/j/k/l>` | Navigate between windows |
| `<Shift-h/l>`    | Previous/next buffer   |

## File Explorer (NvimTree)
| Key         | Action                      |
|-------------|----------------------------|
| `<Space>e`  | Toggle file explorer       |
| `a`         | Add file/directory         |
| `d`         | Delete file/directory      |
| `r`         | Rename file/directory      |
| `x`         | Cut file to clipboard      |
| `c`         | Copy file to clipboard     |
| `p`         | Paste from clipboard       |
| `R`         | Refresh explorer           |

## Search (Telescope)
| Key         | Action                      |
|-------------|----------------------------|
| `<Space>ff` | Find files                 |
| `<Space>fr` | Find recently used files   |
| `<Space>fs` | Find string (grep)         |
| `<Space>fb` | Find open buffers          |
| `<Space>fh` | Find help                  |

## LSP
| Key         | Action                      |
|-------------|----------------------------|
| `gd`        | Go to definition           |
| `gr`        | Find references            |
| `K`         | Show documentation         |
| `<Space>ca` | Code actions               |
| `<Space>rn` | Rename                     |
| `<Space>lf` | Format code                |

## Git
| Key         | Action                      |
|-------------|----------------------------|
| `<Space>gg` | Open LazyGit               |
| `]c`        | Next change                |
| `[c`        | Previous change            |
| `<Space>gs` | Stage hunk                 |
| `<Space>gr` | Reset hunk                 |
| `<Space>gb` | Blame line                 |

## Terminal
| Key         | Action                      |
|-------------|----------------------------|
| `<Space>tv` | Open terminal in vertical split |
| `<Space>th` | Open terminal in horizontal split |
| `<Space>tt` | Open terminal in new tab   |
| `<Space>tc` | Close terminal             |
| `<Esc>`     | Exit terminal mode         |

## Code
| Key         | Action                      |
|-------------|----------------------------|
| `<Space>f`  | Format document            |
| `gcc`       | Toggle line comment        |
| `gc` + motion | Toggle comment on motion |

## Tips
- Press `?` in NvimTree to see all file explorer commands
- Press `<Space>` to see a menu of all available commands
- Use `:Lazy` to manage plugins
- Use `:Mason` to install/manage language servers and tools
]])
					file:close()
				end
			end
		end,
	},
}
