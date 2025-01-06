-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua (nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

--  Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Keep search highlighting enabled
vim.o.hlsearch = true

-- Clear highlights on cursor movement
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function()
        vim.o.hlsearch = false
    end,
})

-- Re-enable highlights for new searches
vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = "[/\\?]",
    callback = function()
        vim.o.hlsearch = true
    end,
})
-- undo history written to disk
vim.o.undofile = true

vim.o.scrolloff = 8

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- Custom mappings for pane navigation with leader keys
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = "Move to left pane", noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = "Move to below pane", noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = "Move to above pane", noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = "Move to right pane", noremap = true, silent = true })

