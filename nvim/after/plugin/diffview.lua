local diffview = require("diffview")

diffview.setup({
    file_panel = {
        win_config = {
            width = 60,
        },
    },
    view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
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

vim.keymap.set("n", "<leader>dh", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen HEAD^")
    else
        vim.cmd("DiffviewClose")
    end
end)

vim.keymap.set("n", "<leader>dm", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd("DiffviewOpen origin/HEAD..HEAD")
    else
        vim.cmd("DiffviewClose")
    end
end)
