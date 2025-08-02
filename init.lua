vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number         = true
vim.o.relativenumber = true
vim.o.signcolumn     = 'yes'
vim.o.wrap           = false
vim.o.scrolloff      = 4
vim.o.cursorline     = true
vim.o.swapfile       = false
vim.o.undofile       = true
vim.o.clipboard      = 'unnamedplus'
vim.o.timeout        = true

vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.expandtab   = true

vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/ggandor/leap.nvim",
    "https://github.com/54322/mru.nvim",
})

vim.cmd("colorscheme onedark")

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python", "lua", "vim", "vimdoc",
    "query", "markdown", "markdown_inline"
  },
  auto_install = true,
  highlight    = { enable = true },
}

require("fzf-lua").setup()

require('oil').setup()

require('Comment').setup({
  toggler   = { line = '<leader>/', block = '<leader>*' },
  opleader  = { line = '<leader>/', block = '<leader>*' },
})

require('leap').add_default_mappings()

require("mru").setup { ignore_filetypes = { "oil" } }

vim.keymap.set('n', '<leader>s',         ':update<cr>:source<cr>')
vim.keymap.set('n', '<leader><leader>',  ':write<cr>')
vim.keymap.set('n', '<leader>q',         ':quit<cr>')
vim.keymap.set('n', '<leader>x',         ':silent !chmod u+x % && echo "Made executable"<cr>')
vim.keymap.set('n', '<leader>o',         ':Oil<cr>')
vim.keymap.set('n', '<leader>f',         ':FzfLua files resume=true<cr>')
vim.keymap.set('n', '<leader>g',         ':FzfLua grep resume=true<cr>')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group    = highlight_group,
  pattern  = '*',
  callback = function() vim.highlight.on_yank() end,
})

vim.o.hlsearch = false

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function() vim.o.hlsearch = false end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "[/\\?]",
  callback = function() vim.o.hlsearch = true end,
})
