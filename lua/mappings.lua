local opts = { noremap = true, silent = true }

--Local term_opts = { silent = true }
local keymap = vim.keymap.set

-- Bind a leader key
keymap("", "<Space>", "<Nop>", opts) -- release previously binded key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   Normal Mode       = 'n',
--   Insert Mode       = 'i',
--   Visual Mode       = 'v',
--   Visual Block Mode = 'x',
--   Terminal Mode     = 't',
--   Command Mode      = 'c',

-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with vim-keys
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Telescope fuzzy finder
local telescope_status_ok, telescope = pcall(require, "telescope.builtin")
if telescope_status_ok then
	keymap("n", "<Leader>ff", telescope.find_files, {})
	keymap("n", "<Leader>fl", telescope.live_grep, {})
	keymap("n", "<Leader>fb", telescope.buffers, {})
	keymap("n", "<Leader>ft", telescope.treesitter, {})
end
