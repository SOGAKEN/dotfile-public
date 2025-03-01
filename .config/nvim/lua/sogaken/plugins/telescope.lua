return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 5,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Quickfix に送る
					},
				},
			},
			pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			},
		})
		-- フローティングウィンドウの背景を透明に設定
		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", ";f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", ";r", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", ";t", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", ";gs", "<cmd>Telescope git_status<cr>", { desc = "Find git status" })
		keymap.set("n", ";gc", "<cmd>Telescope git_commits<cr>", { desc = "Find git commit log" })
		keymap.set("n", ";b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })

		-- Quickfix リストを開く
		keymap.set("n", ";q", "<cmd>Telescope quickfix<cr>", { desc = "Open quickfix list" })

		-- Quickfix リスト内の次/前の一致に移動
		keymap.set("n", "<leader>n", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
		keymap.set("n", "<leader>p", "<cmd>cprev<cr>", { desc = "Previous quickfix item" })
	end,
}
