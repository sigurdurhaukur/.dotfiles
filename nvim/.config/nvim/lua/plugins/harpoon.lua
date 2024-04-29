return {
	"ThePrimeagen/harpoon",
	enabled = true,
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = function()
		local harpoon = require("harpoon")
		local conf = require("telescope.config").values

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end
			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		return {

			-- Harpoon navigation between files.
			{
				"<C-j>",
				function()
					harpoon:list():select(1)
				end,
				desc = "Harpoon: Go to file 1",
			},
			{
				"<C-k>",
				function()
					harpoon:list():select(2)
				end,
				desc = "Harpoon: Go to file 2",
			},
			{
				"<C-l>",
				function()
					harpoon:list():select(3)
				end,
				desc = "Harpoon: Go to file 3",
			},
			{
				"<C-;>",
				function()
					harpoon:list():select(4)
				end,
				desc = "Harpoon: Go to file 4",
			},

			-- Harpoon next/previous file.
			{
				"<C-S-N>",
				function()
					harpoon:nav_file(1)
				end,
				desc = "Harpoon: Next file",
			},
			{
				"<C-S-P>",
				function()
					harpoon:nav_file(-1)
				end,
				desc = "Harpoon: Previous file",
			},

			-- Harpoon add/remove file.
			{
				"<leader>a",
				function()
					harpoon:list():append()
				end,
				desc = "Harpoon: Add file",
			},
			{
				"<leader>hh",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon: Toggle quick menu",
			},

			-- Use Telescope as Harpoon user interface.
			{
				"<C-S-H>",
				function()
					toggle_telescope(harpoon:list())
				end,
				desc = "Open Harpoon window with Telescope",
			},
		}
	end,

	opts = function(_, opts)
		opts.settings = {
			save_on_toggle = true,
			sync_on_ui_close = false,
			save_on_change = true,
			enter_on_sendcmd = false,
			tmux_autoclose_windows = false,
			excluded_filetypes = { "harpoon", "alpha", "dashboard", "gitcommit" },
			mark_branch = false,
			key = function()
				return vim.loop.cwd()
			end,
		}
	end,

	config = function(_, opts)
		require("harpoon").setup(opts)
	end,
}
