-- Terminal
vim.opt.shell = "/bin/bash"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors= true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

-- Python provider
vim.g.python3_host_prog = "/home/perma852/anaconda3/envs/nvim/bin/python3"

-- Colorscheme
vim.cmd.colorscheme "catppuccin"
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end
LineNumberColors()

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.showtabline = 1
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true

-- Other
vim.opt.spell = true
vim.opt.spelllang = { "en", "sv" }
vim.opt.updatetime = 250

-- Highlight while yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
