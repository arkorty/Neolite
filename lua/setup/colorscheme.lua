--local ok, _colors = pcall(require, "melange")
--if not ok then
--    return
--end

-- setup must be called before loading
vim.opt.termguicolors = true
vim.cmd.colorscheme("melange")
