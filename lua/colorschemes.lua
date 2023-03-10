local colorscheme = "base16-black-metal" -- Set colorscheme

if colorscheme == "base16-black-metal" then
	local ok, base16 = pcall(require, "base16-colorscheme")
	if not ok then
		return
	end
	base16.setup({
		--base00 = "#000000",
		base00 = "#171717",
		base01 = "#121212",
		base02 = "#222222",
		--base03 = "#333333",
		base03 = "#494949",
		base04 = "#999999",
		base05 = "#c1c1c1",
		base06 = "#999999",
		base07 = "#c1c1c1",
		base08 = "#5f8787",
		base09 = "#aaaaaa",
		base0A = "#a06666",
		base0B = "#dd9999",
		base0C = "#aaaaaa",
		base0D = "#888888",
		base0E = "#999999",
		base0F = "#444444",
	})
end

if colorscheme == "onedark" then
	-- Onedark Default Configuration
	local ok, onedark = pcall(require, "onedark")
	if not ok then
		return
	end
	onedark.setup({
		-- Main options --
		style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
		-- toggle theme style ---
		toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example '<leader>ts'
		toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},
		-- Lualine options --
		lualine = {
			transparent = false, -- lualine center bar transparency
		},
		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {}, -- Override highlight groups
		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})

	-- Load One Dark
	onedark.load()
end

if colorscheme == "catppuccin" then
	-- Catppuccin
	local ok, catppuccin = pcall(require, "catppuccin")
	if not ok then
		return
	end
	catppuccin.setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = {
			-- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = false, -- show the '~' characters after the end of buffers
		term_colors = false,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			notify = false,
			mini = false,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})

	-- Load Catppuccin
	vim.cmd.colorscheme("catppuccin")
end

if colorscheme == "gruvbox" then
	-- setup must be called before loading the colorscheme
	-- Default options:
	local ok, gruvbox = pcall(require, "gruvbox")
	if not ok then
		return
	end

	gruvbox.setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = true,
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	})

	-- Load Gruvbox
	vim.o.background = "dark" -- or "light" for light mode
	vim.cmd([[colorscheme gruvbox]])
end

if colorscheme == "nord" then
	local ok, nord = pcall(require, "nord")
	if not ok then
		return
	end

	vim.cmd([[colorscheme nord]])
end
