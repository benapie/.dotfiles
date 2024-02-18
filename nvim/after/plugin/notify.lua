local notify = require("notify")

notify.setup({
    max_width = 60,
    render = "wrapped-compact",
    stages = "static",
})

vim.keymap.set("n", "<leader>cn", function()
    notify.dismiss()
end)
