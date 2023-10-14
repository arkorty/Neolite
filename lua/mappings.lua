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

-- Resize with arrow-keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Telescope fuzzy finder
local telescope_status_ok, telescope = pcall(require, "telescope.builtin")
if telescope_status_ok then
	keymap("n", "<Leader>ff", telescope.find_files, {})
	keymap("n", "<Leader>fl", telescope.live_grep, {})
	keymap("n", "<Leader>fb", telescope.buffers, {})
	keymap("n", "<Leader>ft", telescope.treesitter, {})
end

keymap("n", "<Leader>n", ":Neotree toggle<CR>", opts)
keymap("n", "<Leader>w", ":w<CR>", opts)
keymap("n", "<Leader>Q", ":qa<CR>", opts)
