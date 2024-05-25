local fzf = require("fzf-lua")

fzf.setup({
    winopts = { preview = { delay = 0 } },
})
vim.keymap.set("n", "<leader>pf", function()
    fzf.files({
        header = "",
    })
end, {})
vim.keymap.set("n", "<leader>ps", fzf.grep)
