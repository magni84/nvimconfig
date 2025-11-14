local M = {}

function M.langsv()
    vim.opt.spelllang = {'sv'}
    vim.lsp.enable('ltex', false)
    vim.lsp.enable('ltex_sv')
end

function M.test()
    print('hello')
end

function M.langen()
    vim.opt.spelllang = {'en'}
    vim.lsp.enable('ltex_sv', false)
    vim.lsp.enable('ltex')
end

return M


