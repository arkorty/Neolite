-- Bootstrap lazy.nvim and load plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- plugins to load
local plugins = {
    -- Appearance
    {
        "hardhackerlabs/theme-vim",
        name = "hardhacker",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.hardhacker_hide_tilde = 1
            vim.g.hardhacker_keyword_italic = 1
            vim.g.hardhacker_custom_highlights = {}
            vim.cmd("colorscheme hardhacker")
        end,
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
    {
        "navarasu/onedark.nvim",
        config = {
            style = "warmer",
            transparent = true,
            term_colors = true,
            ending_tildes = false,
            cmp_itemkind_reverse = false,
            toggle_style_key = nil,
            toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
            code_style = {
                comments = "italic",
                keywords = "none",
                functions = "none",
                strings = "none",
                variables = "none",
            },
            lualine = { transparent = false },
            colors = {},
            highlights = {},
            diagnostics = {
                darker = true,
                undercurl = true,
                background = true,
            },
        },
    },
    { "EdenEast/nightfox.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "savq/melange-nvim" },

    -- UI
    { "folke/zen-mode.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
    },
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
            direction = "tab",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = { border = "curved" },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        config = { hijack_netrw_behavior = "open_default" },
    },

    -- Git
    { "lewis6991/gitsigns.nvim" },

    -- LSP and Completion
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

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter" },
    { "simrat39/rust-tools.nvim" },

    -- Misc
    { "norcalli/nvim-colorizer.lua" },
    { "github/copilot.vim" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },
}

-- options
local opts = {}

-- setup lazy
require("lazy").setup(plugins, opts)
