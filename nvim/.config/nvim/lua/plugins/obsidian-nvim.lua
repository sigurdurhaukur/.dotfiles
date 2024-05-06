return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Documents/brain/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = vim.fn.expand("~") .. "/Documents/brain",
			},
		},
		daily_notes = {
			folder = "2 areas/daily-notes",
		},
		attatchments = {
			img_folder = vim.fn.expand("~") .. "/Documents/brain/6 attachments",
		},

    -- put new notes in the inbox
    notes_subdir = "8 inbox",
    new_notes_location = "notes_subdir",

    -- control how links are displayed
    wiki_link_func = "prepend_note_id", -- [foo-bar|foo bar]

		note_id_func = function(title)
			local suffix = ""
			local current_datetime = os.date("!%Y-%m-%d")
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return current_datetime .. "-" .. suffix
		end,
	},
}
