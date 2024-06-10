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
	require = { "nvim-lua/plenary.nvim", }
    },
})
