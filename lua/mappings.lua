local opts = { noremap = true, silent = true }

--Local term_opts = { silent = true }
local bind = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- Bind a leader key
bind("", ";", "<Nop>", opts) -- undo any previous bind
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Modes
--   Normal Mode       = 'n',
--   Insert Mode       = 'i',
--   Visual Mode       = 'v',
--   Visual Block Mode = 'x',
--   Terminal Mode     = 't',
--   Command Mode      = 'c',

-- Normal mode --
bind("n", "<C-f>", ":Neotree toggle<CR>", opts)

-- Buffer navigation
bind("n", "<Leader>bp", ":bprev<CR>", opts)
bind("n", "<Leader>bn", ":bnext<CR>", opts)
bind("n", "<Leader>bd", ":bdelete<CR>", opts)

-- Better window navigation
bind("n", "<C-Left>",  "<C-w>h", opts)
bind("n", "<C-Down>",  "<C-w>j", opts)
bind("n", "<C-Up>",  "<C-w>k", opts)
bind("n", "<C-Right>",  "<C-w>l", opts)

-- Resize with arrows
bind("n", "<C-k>", ":resize -2<CR>", opts)
bind("n", "<C-j>", ":resize -2<CR>", opts)
bind("n", "<C-h>", ":vertical resize -2<CR>", opts)
bind("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Fuzzy finder
local telescope_status_ok, telescope = pcall(require, "telescope.builtin")
if telescope_status_ok then
	set("n", "<Leader>tf", telescope.find_files, {})
	set("n", "<Leader>tg", telescope.live_grep, {})
	set("n", "<Leader>tb", telescope.buffers, {})
	set("n", "<Leader>th", telescope.help_tags, {})
end
