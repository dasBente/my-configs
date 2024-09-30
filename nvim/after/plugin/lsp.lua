local lsp = require("lsp-zero")
lsp.preset("recommended")

-- auto-complete
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "nvim_lsp" }
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete()
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	}
})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "gd",
		function() vim.lsp.buf.definition() end,
		{ buffer = bufnr, desc = "Go to Definition" })

	vim.keymap.set("n", "K",
		function() vim.lsp.buf.hover() end,
		{ buffer = bufnr })

	vim.keymap.set("i", "<C-k>",
		function() vim.lsp.buf.hover() end,
		{ buffer = bufnr })

	vim.keymap.set("n", "<leader>dd",
		function() vim.diagnostic.open_float() end,
		{ buffer = bufnr, desc = "Show Diagnostic" })

	vim.keymap.set("n", "<leader>dj",
		function() vim.diagnostic.goto_next() end,
		{ buffer = bufnr, desc = "Next" })

	vim.keymap.set("n", "<leader>dk",
		function() vim.diagnostic.goto_prev() end,
		{ buffer = bufnr, desc = "Previous" })

	vim.keymap.set("n", "<leader>va",
		function() vim.lsp.buf.code_action() end,
		{ buffer = bufnr, desc = "Code Action" })

	vim.keymap.set("n", "<leader>vr",
		function() vim.lsp.buf.rename() end,
		{ buffer = bufnr, desc = "Rename" })

	vim.keymap.set("i", "<C-h>",
		function() vim.lsp.buf.signature_help() end,
		{ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"ts_ls",
		"eslint",
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"bashls",
		"tailwindcss",
		"csharp_ls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	}
})

lsp.setup()

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "buffer" }
			}
		}
	}
})

require "lspconfig".svelte.setup {}
require "lspconfig".csharp_ls.setup {}

require "lspconfig".tailwindcss.setup({
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
			includeLanguages = {
				eelixir = "html-eex",
				eruby = "erb",
				htmlangular = "html",
				templ = "html",
				svelte = "svelte"
			},
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning"
			},
			validate = true
		}
	}
})
