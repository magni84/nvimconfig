-- Terminal
vim.opt.shell = "/bin/bash"
vim.opt.number = true
vim.opt.termguicolors= true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

-- Colorscheme
vim.cmd.colorscheme "catppuccin"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true

-- Other
vim.opt.spell = true
vim.opt.updatetime = 250

-- Highlight while yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
