local M = {}

-- local fip = require("file_ignore_patterns")

-- In order to disable a default keymap, use
-- M.disabled = {
--   n = {
--       ["<leader>h"] = "",
--       ["<C-a>"] = ""
--   }
-- }

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["]c"] = "",
    ["[c"] = "",
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<A-v>"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["td"] = "",
    ["<C-s>"] = "",
    ["<C-n>"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>ra"] = "",
    ["<leader>x"] = "",
    ["<leader>e"] = "",
    ["<leader>th"] = "",
    ["<leader>td"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
  },
  t = {
    ["<A-v>"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
  },
  i = {
    ["<C-e>"] = "",
    ["<C-b>"] = "",
  }
}

M.custom = {
  n = {
    ["ti"] = {
      function ()
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
          cmd = "tig",
          direction = "float",
          float_opts = {
            border = "double",
          },
        })
        lazygit:toggle()
      end,
      "Git commits current branch"
    },

    ["<leader>ti"] = {
      function ()
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
          cmd = "tig --all",
          direction = "float",
          float_opts = {
            border = "double",
          },
        })
        lazygit:toggle()
      end,
      "Git commits all branches"
    },

    ["th"] = {
      function ()
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
          cmd = "tig status",
          direction = "float",
          float_opts = {
            border = "double",
          },
        })
        lazygit:toggle()
      end,
      "Git status"
    },

    ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<C-d>"] = {"<C-d>zz", "Centered scroll down"},
    ["<C-u>"] = {"<C-u>zz", "Centered scroll up"},
    ["n"] = {"n", "Centered find next"},
    ["N"] = {"N", "Centered find previous"},
  },

  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selection down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selection up" }
  }
}

M.lspconfig = {
  n = {
    ["gr"] = {
      function ()
        local patterns = require("file_ignore_patterns").patterns
        require("telescope.builtin").lsp_references({
          file_ignore_patterns=patterns,
          jump_type="tab"
        })
      end,
      "LSP references"
    },

    ["<leader>re"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>d["] = { "<cmd> lua vim.diagnostic.goto_prev() <CR>", "Jump to previous problem" },
    ["<leader>d]"] = { "<cmd> lua vim.diagnostic.goto_next() <CR>", "Jump to next problem" },
    ["<leader>dd"] = { "<cmd> Telescope diagnostics <CR>", "Show diagnostic problems" },
  }
}

M.telescope = {
  n = {
    ["<leader>ff"] = {
      function ()
        local patterns = require("file_ignore_patterns").patterns
        require("telescope.builtin").find_files({file_ignore_patterns=patterns})
      end,
      "Find files"
    },

    ["<leader>fw"] = {
      function ()
        local patterns = require("file_ignore_patterns").patterns
        require("telescope.builtin").live_grep({file_ignore_patterns=patterns})
      end,
      "Live grep"
    },
  }
}

M.gitsigns = {
  n = {
    ["]h"] = {
      function()
        if vim.wo.diff then
          return "]h"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[h"] = {
      function()
        if vim.wo.diff then
          return "[h"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>hd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.tabufline = {
  n = {
    ["gp"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["gn"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["gx"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  }
}

return M

