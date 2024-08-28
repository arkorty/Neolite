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
    keymap(
        "n",
        "<Leader>ff",
        "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '--no-ignore', '-g', '!.git' }})<cr>",
        {}
    )
    keymap("n", "<Leader>ll", telescope.live_grep, {})
    keymap("n", "<Leader>bb", telescope.buffers, {})
    keymap("n", "<Leader>tt", telescope.treesitter, {})
end

-- Lsp controls
keymap("n", "<Leader>ls", ":LspStart<CR>", opts)
keymap("n", "<Leader>lS", ":LspStop<CR>", opts)
keymap("n", "<Leader>lr", ":LspRestart<CR>", opts)
keymap("n", "<Leader>li", ":LspInfo<CR>", opts)

-- Buffer controls
keymap("n", "<Leader>BB", ":bdelete<CR>", opts)
keymap("n", "<Leader>jj", ":bprevious<CR>", opts)
keymap("n", "<Leader>kk", ":bnext<CR>", opts)
keymap("n", "<Leader>nn", ":Neotree toggle<CR>", opts)

-- System clipboard yank and paste
keymap("n", "P", '"+p', opts)
keymap("v", "P", '"+p', opts)
keymap("v", "Y", '"+y', opts)

-- Toggleterm controls
function _G.set_terminal_keymaps()
    local topts = { buffer = 0 }
    keymap("t", "<esc>", [[<C-\><C-n>]], topts)
    keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], topts)
    keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], topts)
    keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], topts)
    keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], topts)
    keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], topts)
end

vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- Toggle ZenMode
keymap("n", "<Leader>zz", ':ZenMode<CR>', opts)
