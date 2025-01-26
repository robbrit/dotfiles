return {
	"catppuccin/nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme catppuccin]])
		require("nvim-web-devicons").setup({})
		require("catppuccin").setup({
			integrations = {
				barbar = true,
				neotree = true,
				mason = true,
				diffview = true,
				indent_blankline = { enabled = true, colored_indent_levels = true, scope_color = "" },
			},
		})
	end,
}
