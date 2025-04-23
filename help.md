# BATMERT Neovim Keybindings

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
