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
		{ buffer = bufnr, desc = "Definition" })

	vim.keymap.set("n", "K",
		function() vim.lsp.buf.hover() end,
		{ buffer = bufnr })

	vim.keymap.set("n", "<leader>vw",
		function() vim.lsp.buf.workspace_symbol() end,
		{ buffer = bufnr, desc = "Workspace Symbols" })

	vim.keymap.set("n", "<leader>vd",
		function() vim.diagnostic.open_float() end,
		{ buffer = bufnr, desc = "Diagnostic" })

	vim.keymap.set("n", "[d",
		function() vim.diagnostic.goto_next() end,
		{ buffer = bufnr, desc = "Next Diagnostic" })

	vim.keymap.set("n", "]d",
		function() vim.diagnostic.goto_prev() end,
		{ buffer = bufnr, desc = "Prev Diagnostic" })

	vim.keymap.set("n", "<leader>vc",
		function() vim.lsp.buf.code_action() end,
		{ buffer = bufnr, desc = "Code Action" })

	vim.keymap.set("n", "<leader>vv",
		function() vim.lsp.buf.references() end,
		{ buffer = bufnr, desc = "References" })

	vim.keymap.set("n", "<leader>vr",
		function() vim.lsp.buf.rename() end,
		{ buffer = bufnr })

	vim.keymap.set("i", "<C-h>",
		function() vim.lsp.buf.signature_help() end,
		{ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"eslint",
		"lua_ls",
		"rust_analyzer",
		"pyright",
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
				globals = {"vim", "buffer"}
			}
		}
	}
})

require"lspconfig".svelte.setup{}
