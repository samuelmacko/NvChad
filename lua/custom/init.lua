
-- Custom options

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

require("custom.globals")

vim.api.nvim_create_user_command("SearchFilterSet",
  function()
    require("file_ignore_patterns").search_filter_set()
    package.loaded["file_ignore_patterns"] = nil
  end,
  {}
)

vim.api.nvim_create_autocmd("FileType", {
  callback = function ()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" }
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function ()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})
