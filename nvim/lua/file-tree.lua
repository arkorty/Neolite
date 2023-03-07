-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

-- file tree options
nvim_tree.setup({
	sort_by = "case_sensitive",
	update_cwd = true,
	renderer = {
		group_empty = true,
		root_folder_label = ":t",
		indent_width = 2,
	},
	filters = {
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		exclude = {},
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 200,
	},
})

-- open file tree at startup
local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- create a new, empty buffer
	vim.cmd.enew()

	-- wipe the directory buffer
	vim.cmd.bw(data.buf)

	-- change to the directory
	vim.cmd.cd(data.file)

	-- open the tree
	local api_ok, api = pcall(require, "nvim-tree.api")
	if not api_ok then
		return
	end
	api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
