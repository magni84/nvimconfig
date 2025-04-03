return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		init = function()
			-- this is an example, not a default. Please see the readme for more configuration options
			vim.g.molten_output_win_max_height = 40
			vim.g.molten_image_provider = "image.nvim"
		end,
	},
	{
		"3rd/image.nvim",
		build = false,
		opts = {},
		config = function()
			require("image").setup({
				backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
				processor = "magick_cli",
				integrations = {}, -- do whatever you want with image.nvim's integrations
				max_width = nil, -- tweak to preference
				max_height = nil, -- ^
				max_height_window_percentage = 90, -- this is necessary for a good experience
				max_width_window_percentage = 30,
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
			local runner = require("quarto.runner")
			quarto.setup()
			vim.keymap.set("n", "<leader>cq", quarto.quartoPreview, { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
			vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
			vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
			vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
			vim.keymap.set(
				"n",
				"<leader>rk",
				":MoltenEvaluateArgument %reset -f<CR>",
				{ desc = "reset kernel", silent = true }
			)
            vim.keymap.set("n", "<leader>mi", ":MoltenInterupt<CR>", { desc = "MoltenInterupt" })
            vim.keymap.set("n", "<leader>ms", ":MoltenInit<CR>", { desc = "MoltenInit" })
            vim.keymap.set("n", "<leader>md", ":MoltenDeinit<CR>", { desc = "MoltenDeinit" })
			vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
			vim.keymap.set("n", "<leader>RA", function()
				runner.run_all(true)
			end, { desc = "run all cells of all languages", silent = true })

			local wk = require("which-key")
			local is_code_chunk = function()
				local current, _ = require("otter.keeper").get_current_language_context()
				if current then
					return true
				else
					return false
				end
			end

			--- Insert code chunk of given language
			--- Splits current chunk if already within a chunk
			--- @param lang string
			local insert_code_chunk = function(lang)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "n", true)
				local keys
				if is_code_chunk() then
					keys = [[o```<cr><cr>```{]] .. lang .. [[}<esc>o]]
				else
					keys = [[o```{]] .. lang .. [[}<cr>```<esc>O]]
				end
				keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
				vim.api.nvim_feedkeys(keys, "n", false)
			end

			local insert_py_chunk = function()
				insert_code_chunk("python")
			end
			wk.add({
				{ "<C-p>", insert_py_chunk, desc = "python code chunk" },
			}, { mode = "n", silent = true })
			-- insert mode
			wk.add({
				{
					mode = { "i" },
					{ "<C-p>", insert_py_chunk, desc = "python code chunk" },
				},
			}, { mode = "i" })
		end,
	},
}
