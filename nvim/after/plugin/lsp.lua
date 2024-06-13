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

	--local opts = {buffer, bufnr, remap = false}
	--vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	--vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	--vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	--vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	--vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	--vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	--vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	--vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	--vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	--vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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
