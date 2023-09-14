-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers", -- set to "buffers" to only show buffers instead
	},
})
