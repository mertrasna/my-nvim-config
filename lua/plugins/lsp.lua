return {
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
		config = function()
			-- Setup Mason for managing LSP servers, linters, and formatters
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Make sure we use ts_ls instead of tsserver
			require("mason-lspconfig").setup({
				-- Ensure these servers are automatically installed
				ensure_installed = {
					"lua_ls", -- Lua
					"ts_ls", -- TypeScript (notice we're using ts_ls instead of tsserver)
					"html", -- HTML
					"cssls", -- CSS
					"pyright", -- Python
					"jsonls", -- JSON
				},
				-- Disable automatic installation prompts
				automatic_installation = false,
				-- Hide the install messages
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							on_attach = on_attach,
						})
					end,
				},
			})

			-- Setup neovim lua configuration
			require("neodev").setup()

			-- Status indicator for LSP (configure to be less intrusive)
			require("fidget").setup({
				notification = {
					window = {
						winblend = 0, -- Make it less transparent
					},
					view = {
						stack_upwards = false, -- Display notifications in a stack
					},
				},
			})

			-- LSP settings
			local lspconfig = require("lspconfig")

			-- Add key mappings when a language server attaches
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				-- Key mappings for LSP functionality
				nmap("gd", vim.lsp.buf.definition, "Goto Definition")
				nmap("gr", vim.lsp.buf.references, "Goto References")
				nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
				nmap("gI", vim.lsp.buf.implementation, "Goto Implementation")
				nmap("gt", vim.lsp.buf.type_definition, "Goto Type Definition")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
				nmap("<leader>ls", vim.lsp.buf.signature_help, "Signature Help")
				nmap("<leader>lf", vim.lsp.buf.format, "Format Code")
			end

			-- Configure lua_ls for Neovim
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- Configure other language servers
			local servers = { "ts_ls", "html", "cssls", "pyright", "jsonls" }
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
				})
			end
		end,
	},
}
