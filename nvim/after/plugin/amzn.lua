local amzn = require("amzn")
local amzn_col_width_override = amzn.get_col_width_override()

if amzn_col_width_override ~= nil then
    vim.opt.colorcolumn = tostring(amzn_col_width_override)
else
    vim.opt.colorcolumn = "80"
end

local function get_remote_code_url()
    local url = amzn.get_brazil_remote_code_url()
    if not url then
        return nil
    end
    vim.fn.setreg("+", url)
    vim.notify("Copied \n" .. url .. "\nto the clipboard.")
end

vim.keymap.set("n", "<leader>og", get_remote_code_url)
vim.keymap.set("v", "<leader>og", get_remote_code_url)
