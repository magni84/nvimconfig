return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				highlight = {
					enable = true,
					disable = { "latex" },
				},
				indent = { enable = true },
				auto_install = true,
			})
		end,
	},
}
