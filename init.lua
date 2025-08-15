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
vim.o.winborder      = 'rounded'

vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.expandtab   = true

vim.pack.add({
    "https://github.com/olimorris/onedarkpro.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/54322/mru.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/numToStr/Comment.nvim",
})

vim.cmd("colorscheme onedark")

require("fzf-lua").setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "python", "lua", "vim", "vimdoc",
    "query", "markdown", "markdown_inline"
  },
  auto_install = true,
  highlight    = { enable = true },
}

vim.lsp.enable({ 'pyright' })

vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {
  noremap = true, silent = true,
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>r', function()
  require('fzf-lua').lsp_references()
end, opts)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})
vim.o.completeopt = "menu,menuone,noselect"

vim.keymap.set('i', '<Tab>', [[
  pumvisible() ? "\<C-n>" : "\<Tab>"
]], { expr = true, noremap = true })
vim.keymap.set('i', '<S-Tab>', [[
  pumvisible() ? "\<C-p>" : "\<S-Tab>"
]], { expr = true, noremap = true })
vim.keymap.set('i', '<CR>', [[
  pumvisible() ? "\<C-y>" : "\<CR>"
]], { expr = true, noremap = true })

require('oil').setup()

require("mru").setup { ignore_patterns = { "oil:*", '/private/*' } }

require('Comment').setup({
  toggler   = { line = '<leader>/', block = '<leader>*' },
  opleader  = { line = '<leader>/', block = '<leader>*' },
})

vim.keymap.set('n', '<leader>s',         ':update<cr>:source<cr>')
vim.keymap.set('n', '<leader><leader>',  ':write<cr>')
vim.keymap.set('n', '<leader>q',         ':quit<cr>')
vim.keymap.set('n', '<leader>x',         ':silent !chmod u+x % && echo "Made executable"<cr>')
vim.keymap.set('n', '<leader>o',         ':Oil<cr>')
vim.keymap.set('n', '<leader>f',         ':FzfLua files resume=false<cr>')
vim.keymap.set('n', '<leader>g',         ':FzfLua grep<cr>')

vim.api.nvim_set_hl(0, 'Visual', { bg = '#2563eb', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'Search', { bg = '#2563eb', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#2563eb', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#2563eb', fg = '#ffffff' })

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local o = vim.opt_local
    o.autoindent   = false
    o.smartindent  = false
    o.cindent      = false
    o.indentexpr   = ""
    o.cinoptions   = ""

    o.formatoptions:remove({ "r", "o", "c" })
  end,
})
