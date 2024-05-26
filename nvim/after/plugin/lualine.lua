local lualine = require("lualine")

lualine.setup({
    options = { theme = "auto" },
    sections = {
        lualine_a = { { "mode", padding = 2 } },
        lualine_b = {
            {
                "harpoon2",
                indicators = { "h", "t", "n", "s" },
                active_indicators = { "H", "T", "N", "S" },
                padding = 2,
            },
        },
        lualine_c = { { "filename", path = 1, padding = 2 } },
        lualine_x = { { "branch", padding = 2 } },
        lualine_y = {},
    },
})
