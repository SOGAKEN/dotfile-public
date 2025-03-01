-- LazyVim の設定ファイル (例: lua/config/lazy.lua) に以下を追加

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-p>]],
				direction = "float",
			})
		end,
	},
}
