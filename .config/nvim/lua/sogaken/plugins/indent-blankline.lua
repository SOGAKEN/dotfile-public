return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local highlight = {
			-- "RainbowRed",
			-- "RainbowYellow",
			-- "RainbowBlue",
			-- "RainbowOrange",
			-- "RainbowGreen",
			-- "RainbowViolet",
			-- "RainbowCyan",
			-- "IblScope",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#839463" })
			-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			-- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			-- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			-- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			-- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			-- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			-- vim.api.nvim_set_hl(0, "IblScope", { fg = "#00B6C2" })
		end)

		require("ibl").setup({
			indent = {
				-- highlight = highlight,
				char = "┊",
				tab_char = "┊",
			},
			scope = {
				-- enabled = true,
				-- highlight = highlight,
			},
		})
	end,
}
