-- github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {

			}
		end
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>pt", "<cmd>Neotree toggle position=right<cr>", desc = "NeoTree" },
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim"
	},
	config = function()
		require("neo-tree").setup()
	end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", },
		config = function()
			require("cmp")
			vim.opt.completeopt = { "menu", "menuone", "noselect" }
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim", "Snikimonkd/telescope-git-conflicts.nvim" },
		config = function()
			require("telescope").setup({})
			require("telescope").load_extension("conflicts")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		keys = {
			{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "undo history" }
		},
		opts = { undo = {}, }, -- https://github.com/debugloop/telescope-undo.nvim?tab=readme-ov-file#configuration
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
	"tpope/vim-fugitive",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	"williamboman/mason-lspconfig.nvim",
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{"Vigemus/iron.nvim"},
	{"sveltejs/language-tools"},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end
	},
	{
		"paopaol/telescope-git-diffs.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("telescope").load_extension("git_diffs")
		end
	},
	{
		"joeveiga/ng.nvim"
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {}
	}
})
