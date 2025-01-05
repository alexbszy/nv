require('options')
require('highlight-on-yank')

-- Install package manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
}, {})

require('configure-fzf-lua')
require('configure-gp')
require('configure-lsp')
require('configure-mini')
require('configure-nvim-cmp')
require('configure-nvim-tree')
require('configure-toggleterm')
require('configure-treesitter')

