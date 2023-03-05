local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason.setup({})

mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
})

local cnl_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cnl_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

mason_lspconfig.setup_handlers({
	function(server)
		lspconfig[server].setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})
	end,
	--["rust_analyzer"] = function()
	--	local rt_ok, rust_tools = pcall(require, "rust-tools")
	--	if rt_ok then
	--		rust_tools.setup({})
	--	end
	--end,
})
