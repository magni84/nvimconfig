return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ltex", "texlab", "pyright", "jsonls", "marksman" },
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "stylua", "black", "prettier" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = cpabilities
            })
            lspconfig.marksman.setup({
                capabilities = capabilities,
                filetypes = {'markdown', 'quarto'},
            })
            lspconfig.ltex.setup({
                capabilities = capabilities,
            })
            lspconfig.texlab.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp Hover" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp Go to definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier
                },
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
        end,
    },
}
