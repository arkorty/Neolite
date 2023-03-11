local ok, packer = pcall(require, "packer")
if not ok then
	return
end

packer.startup(function(use)
	-- Transparency
	use("xiyaowong/nvim-transparent")

	-- Base16 colorscheme
	use("RRethy/nvim-base16")

	-- Nord colorscheme
	use("shaunsingh/nord.nvim")

	-- Onedark colorscheme
	use("navarasu/onedark.nvim")

	-- Gruvbox colorscheme
	use("ellisonleao/gruvbox.nvim")

	-- Catppuccin colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Plugin manager
	use("wbthomason/packer.nvim")

	-- Terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- File tree
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" }, tag = "nightly" })

	-- Statusline
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	-- Buffer tabs
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } })

	-- LSP manager
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("onsails/lspkind.nvim")
	use("hrsh7th/cmp-nvim-lsp")

	-- Syntax highlighting
	use("nvim-treesitter/nvim-treesitter")

	-- Rust tools
	--use("simrat39/rust-tools.nvim")
end)
