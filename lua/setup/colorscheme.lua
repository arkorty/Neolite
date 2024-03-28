local ok, _colors = pcall(require, "nightfox")
if not ok then
    return
end

-- setup must be called before loading
vim.cmd("colorscheme carbonfox")
