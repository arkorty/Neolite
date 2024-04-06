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
    { "stevearc/dressing.nvim",   event = "VeryLazy" },
    { "ellisonleao/gruvbox.nvim", priority = 1000,   config = true },
    {
        "navarasu/onedark.nvim",
        config = {                        -- Lua
            -- Main options --
            style = 'warmer',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false,          -- Show/hide background
            term_colors = true,           -- Change terminal color as per the selected theme style
            ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

            -- toggle theme style ---
            toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
            toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = 'italic',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },

            -- Lualine options --
            lualine = {
                transparent = false, -- lualine center bar transparency
            },

            -- Custom Highlights --
            colors = {},     -- Override default colors
            highlights = {}, -- Override highlight groups

            -- Plugins Config --
            diagnostics = {
                darker = true,     -- darker colors for diagnostic
                undercurl = true,  -- use undercurl instead of underline for diagnostics
                background = true, -- use background color for virtual text
            },
        }
    },
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
                direction = "float",
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
