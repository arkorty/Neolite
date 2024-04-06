local ok, _colors = pcall(require, "onedark")
if not ok then
    return
end

-- setup must be called before loading
vim.cmd("colorscheme onedark")
