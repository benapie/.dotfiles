local zen = require("zen-mode")

local zen_open = false

function create_zen_config(width)
	return {
		window = {
			width = width,
			height = 0.9,
		},
		on_open = function()
			zen_open = true
		end,
		on_close = function()
			zen_open = false
		end,
	}
end

zen.setup(create_zen_config(86))

vim.keymap.set("n", "<leader>zz", function()
	zen.toggle()
end)

vim.keymap.set("n", "<leader>lrc", function()
	zen.setup({
		window = {
			width = 120,
			height = 0.9,
		},
	})
	if zen_open == true then
		zen.toggle()
		zen.toggle()
	end
end)
