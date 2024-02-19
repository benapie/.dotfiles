local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },

    "theprimeagen/harpoon",

    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig", -- lsp support
            "hrsh7th/nvim-cmp", -- autocompletion
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    },
    "gelguy/wilder.nvim", -- better wildmeun
    "folke/zen-mode.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },

    { "folke/trouble.nvim", opts = { icon = true } },

    "tpope/vim-fugitive",
    "embark-theme/vim",

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    "axelvc/template-string.nvim",

    "mhartington/formatter.nvim",

    {
        dir = "~/.dotfiles/amzn/nvim",
        name = "amzn",
    },
})
