return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }, -- diffview.nvimはplenary.nvimが必要です
		cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- lazy loadのためのトリガーコマンド
		config = function()
			require("diffview").setup({
				-- 必要に応じて各種オプションを設定できます
				-- 例:
				-- enhanced_diff_hl = true,
				-- use_icons = true,
			})
		end,
	},
}
