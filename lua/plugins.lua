local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.startup(function(use)
	-- Onedark colorscheme
	use({ "navarasu/onedark.nvim" })

	-- Gruvbox colorscheme
	use({ "ellisonleao/gruvbox.nvim" })

	-- Catppuccin colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Plugin manager
	use({ "wbthomason/packer.nvim" })

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- File tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Buffer tabs
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- LSP manager
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })

	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	use("onsails/lspkind.nvim")
	use("windwp/nvim-autopairs")
	use("hrsh7th/cmp-nvim-lsp")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ntsi_ok, nvim_treesitter_install = pcall(require, "nvim-treesitter.install")
			if ntsi_ok then
				local ts_update = nvim_treesitter_install.install.update({ with_sync = true })
				ts_update()
			end
		end,
	})

	--use 'neovim/nvim-lspconfig'
	use("simrat39/rust-tools.nvim")

	-- Debugging
	--use 'nvim-lua/plenary.nvim'
	use("mfussenegger/nvim-dap")
end)
