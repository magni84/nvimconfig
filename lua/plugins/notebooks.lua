return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        init = function()
            -- this is an example, not a default. Please see the readme for more configuration options
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_image_provider = "image.nvim"
        end,
    },
    {
        "3rd/image.nvim",
        build = false,
        opts = {},
        config = function()
            require("image").setup({
                backend = "kitty",            -- Kitty will provide the best experience, but you need a compatible terminal
                processor = "magick_cli",
                integrations = {},            -- do whatever you want with image.nvim's integrations
                max_width = 100,              -- tweak to preference
                max_height = 12,              -- ^
                max_height_window_percentage = math.huge, -- this is necessary for a good experience
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = true,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            })
        end,
    },
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("quarto").setup({
                debug = false,
                closePreviewOnExit = true,
                lspFeatures = {
                    enabled = true,
                    chunks = "curly",
                    languages = { "r", "python", "julia", "bash", "html" },
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                codeRunner = {
                    enabled = true,
                    default_method = "molten", -- "molten", "slime", "iron" or <function>
                    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                    -- Takes precedence over `default_method`
                    never_run = { "yaml" }, -- filetypes which are never sent to a code runner
                },
            })
            local quarto = require("quarto")
            quarto.setup()
            vim.keymap.set("n", "<leader>qp", quarto.quartoPreview, { silent = true, noremap = true })
        end,
    },
}
