local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'lukas-reineke/indent-blankline.nvim',
	'lewis6991/gitsigns.nvim',
	'xiyaowong/transparent.nvim',
	'shaunsingh/nord.nvim',
	'Mofiqul/dracula.nvim',
	'navarasu/onedark.nvim',
	'ellisonleao/gruvbox.nvim',
	'sainnhe/everforest',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'jose-elias-alvarez/null-ls.nvim',
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'saadparwaiz1/cmp_luasnip',
	'onsails/lspkind.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'nvim-treesitter/nvim-treesitter',
	'simrat39/rust-tools.nvim',
	{ 'catppuccin/nvim', as = 'catppuccin' },
	{ 'akinsho/toggleterm.nvim', version = '*', config = true },
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', opt = true } },
	{ 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' }, tag = 'nightly' },
	{
		'akinsho/bufferline.nvim',
		version = '*',
		dependencies = 'nvim-tree/nvim-web-devicons',
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		},
	},
}

local opts = {}

require('lazy').setup(plugins, opts)
