-- Utilities for creating configurations
local util = require("formatter.util")

vim.keymap.set("n", "<leader>f", "<cmd>:Format<CR>")

local function prettier()
	return {
		exe = "prettierd",
		args = { util.escape_path(util.get_current_buffer_file_path()) },
		stdin = true,
	}
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = { require("formatter.filetypes.lua").stylua },
		javascript = { prettier },
		typescript = { prettier },
		typescriptreact = {
			prettier,
		},
		toml = { require("formatter.filetypes.toml").taplo },
	},
})
