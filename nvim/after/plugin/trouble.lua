local trouble = require("trouble")

vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end,
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end,
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end,
    { silent = true, noremap = true }
)
