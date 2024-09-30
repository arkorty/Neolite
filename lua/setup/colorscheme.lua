local ok, _ = pcall(require, "gruvbox")
if not ok then
    return
end

-- setup must be called before loading
vim.opt.termguicolors = true
vim.cmd.colorscheme("gruvbox")
