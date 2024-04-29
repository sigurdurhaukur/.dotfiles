return {
	"lervag/vimtex",
	lazy = false, -- lazy-loading will disable inverse search
	config = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
			pattern = { "bib", "tex" },
			callback = function()
				vim.wo.conceallevel = 1
			end,
		})

		vim.g.vimtex_quickfix_open_on_warning = 0

		vim.g.vimtex_quickfix_ignore_filters = {
			"Command terminated with space",
			"LaTeX Font Warning: Font shape",
			"Package caption Warning: The option",
			"LaTeX Warning: `!h' float specifier changed to `!ht'.",
			[[Underfull \\hbox (badness [0-9]*) in]],
			"Package enumitem Warning: Negative labelwidth",
			[[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
			[[Package caption Warning: Unused \\captionsetup]],
			"Package typearea Warning: Bad type area settings!",
			[[Package fancyhdr Warning: \\headheight is too small]],
			[[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
			"Package hyperref Warning: Token not allowed in a PDF string",
			[[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
		}
		vim.g.tex_conceal = "abdmg"
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
	end,
}
