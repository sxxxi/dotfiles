return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local telescope =require"telescope"
			telescope.setup {
				extensions = {
					file_browser = {
						grouped = true,
						sorting_strategy = "ascending",
					}
				}
			}
			telescope.load_extension "file_browser"
		end,
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc="Telescope file finder"},
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc="Telescope help tags"},
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc="Telescope live grep"},
			{ "<leader>fb", "<cmd>Telescope file_browser<CR><ESC>", desc="Telescope file browser"},
		},
	},
}
