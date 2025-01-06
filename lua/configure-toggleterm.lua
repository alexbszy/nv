require("toggleterm").setup({
  direction = "float",
  shade_terminals = true,
  persist_size = true,
  start_in_insert = true,
})

vim.keymap.set('n', '<leader><leader>', function()
  -- Open or toggle the terminal
  require("toggleterm").toggle()
  -- Use a slight delay to ensure terminal mode is activated
  vim.defer_fn(function()
    vim.cmd("startinsert")
  end, 10) -- 10ms delay
end, { noremap = true, silent = true })

-- Keymap to close the terminal with <Esc> in terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], { noremap = true, silent = true })

