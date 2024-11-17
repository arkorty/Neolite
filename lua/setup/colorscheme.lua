local ok, _ = pcall(require, "monokai")
if not ok then
    return
end

-- setup must be called before loading
vim.opt.termguicolors = true
vim.cmd.colorscheme("monokai_charcoal")
