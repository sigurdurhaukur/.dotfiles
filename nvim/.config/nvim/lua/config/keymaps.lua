local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Directory navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate right

-- Window managment
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- split vertically
keymap.set("n", "<leader>sh", ":vsplit<CR>", opts) -- horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle minimize

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Obsidian nvim
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>", { silent = true, noremap = true })

local api = vim.api

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })
