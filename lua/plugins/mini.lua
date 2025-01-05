-- https://github.com/echasnovski/mini.nvim/tree/main

return {
  'echasnovski/mini.nvim',
  version = '*',
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function(_, opts)
      require("mini.icons").setup(opts)
    end,
  }
