require("toggleterm").setup({
  direction = "float",
  open_mapping = [[<leader>t]], -- Mapping to toggle the terminal
  shade_terminals = true,   -- Shade terminal backgrounds
  persist_size = true,      -- Retain the size of the terminal split
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Exit terminal mode
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts) -- Move to the left pane
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts) -- Move to the bottom pane
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts) -- Move to the top pane
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts) -- Move to the right pane
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

