local zen = require("zen-mode")
local amzn = require("amzn")

local function get_col_width()
    local override = amzn.get_col_width_override()

    if override ~= nil then
        return override + 6
    else
        return 86
    end
end

zen.setup({
    window = {
        width = get_col_width(),
        height = 0.9,
    },
})

vim.keymap.set("n", "<leader>zz", function()
    zen.toggle()
end)
