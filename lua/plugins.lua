local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	"lewis6991/gitsigns.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"nvim-treesitter/nvim-treesitter",
	"simrat39/rust-tools.nvim",
	"EdenEast/nightfox.nvim", -- lazy
	"nvim-lualine/lualine.nvim",
	{
		"nvim-telescope/telescope.nvim",
		--tag = "0.1.2",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
