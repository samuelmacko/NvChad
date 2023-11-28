local plugins = {
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "lua-language-server",
        "gopls",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.configs.telescope"
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "go",
      }
    }
  },
  {
    dir = "~/git/lua_modules/file_ignore_patterns.lua",
  },
  {
    "MunifTanjim/nui.nvim"
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = 'qf',
    opts = {
      preview = {
        auto_preview = false
      },
      func_map = {
        pscrollup = "K",
        pscrolldown = "J",
      }
    }
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
}
return plugins
