return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd("colorscheme rose-pine")
	end,
}
