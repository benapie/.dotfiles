local amzn = require("amzn")
local amzn_col_width_override = amzn.get_col_width_override()

if amzn_col_width_override ~= nil then
    vim.opt.colorcolumn = tostring(amzn_col_width_override)
else
    vim.opt.colorcolumn = "80"
end

vim.keymap.set("n", "<leader>og", amzn.get_brazil_remote_code_url)
vim.keymap.set("v", "<leader>og", amzn.get_brazil_remote_code_url)
