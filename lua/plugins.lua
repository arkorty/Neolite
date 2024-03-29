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
    {
      "folke/zen-mode.nvim",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "EdenEast/nightfox.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "savq/melange-nvim" },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = true,
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "onsails/lspkind.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "simrat39/rust-tools.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
	{
		"nvim-telescope/telescope.nvim",
		--tag = "0.1.2",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	},
    {
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			opts = {
                size = function(term)
                  if term.direction == "horizontal" then
                    return 24
                  elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                  end
                end,
				open_mapping = [[<C-\>]],
				hide_numbers = true,
				start_in_insert = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
				},
			},
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
