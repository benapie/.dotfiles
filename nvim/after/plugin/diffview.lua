local diffview = require("diffview")

diffview.setup({
    file_panel = {
        win_config = {
            width = 60,
        },
    },
})

vim.keymap.set("n", "<leader>dv", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen")
    else
        vim.cmd("DiffviewClose")
    end
end)
