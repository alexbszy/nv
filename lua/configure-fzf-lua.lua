require("fzf-lua").setup({ keymap = { builtin = { true, ["<Esc>"] = "hide" } } })

vim.keymap.set('n', '<leader>d', ":FzfLua<CR>", { desc = "Open FzfLua", noremap = true, silent = true })
