local zen = require("zen-mode")

zen.setup({
	window = {
		width = 86,
		height = 0.9,
		options = {},
	},
})

vim.keymap.set("n", "<leader>zz", function()
	zen.toggle()
end)
