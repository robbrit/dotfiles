return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = false,
	init = function()
		local telescope = require("telescope.builtin")
		vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Telescope find file" })
		vim.keymap.set('n', '<leader>fs', telescope.live_grep, { desc = "Telescope search string" })

		require("telescope").setup({
			pickers = {
				find_files = {
					hidden = true
				}
			}
		})
	end
}
