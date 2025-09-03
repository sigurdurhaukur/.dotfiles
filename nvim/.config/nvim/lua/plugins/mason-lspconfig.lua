local opts = {
	ensure_installed = {
		"efm",
		"bashls",
		"solidity",
		"tailwindcss",
		"pyright",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		"clangd", -- c++ lsp
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
