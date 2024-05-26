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

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            },
        },
    },

    "nvim-lua/plenary.nvim",

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { "junegunn/fzf", build = "./install --bin" },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
    "gelguy/wilder.nvim", -- better wildmenu
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

    {
        "projekt0n/github-nvim-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({})

            vim.o.background = "dark"
            vim.cmd("colorscheme github_dark_default")
        end,
    },

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

    "sindrets/diffview.nvim",

    "windwp/nvim-ts-autotag",

    "nvim-tree/nvim-web-devicons",
})
