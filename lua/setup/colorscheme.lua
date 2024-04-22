local ok, _ = pcall(require, "onedark")
if not ok then
    return
end

-- setup must be called before loading
vim.opt.termguicolors = true
vim.cmd.colorscheme("onedark")
