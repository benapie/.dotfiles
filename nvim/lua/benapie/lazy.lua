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
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            {
                "neovim/nvim-lspconfig",
                version = "*", -- due to eslint bug: https://github.com/LazyVim/LazyVim/issues/3384
            },
            "hrsh7th/nvim-cmp", -- autocompletion
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    },
    --"gelguy/wilder.nvim", -- better wildmenu
    "folke/zen-mode.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update =
                require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },

    {
        "folke/trouble.nvim",
        opts = { icon = true },
        keys = {
            {
                "<leader>xw",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
        },
    },

    "tpope/vim-fugitive",

    --    {
    --        "projekt0n/github-nvim-theme",
    --        lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --        priority = 1000, -- make sure to load this before all the other start plugins
    --        config = function()
    --            require("github-theme").setup({
    --                options = {
    --                    styles = {
    --                        comments = "italic",
    --                    },
    --                },
    --            })
    --
    --            vim.o.background = "dark"
    --            vim.cmd("colorscheme github_dark_high_contrast")
    --        end,
    --    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        config = function()
            vim.opt.background = "dark"
            vim.cmd.colorscheme("oxocarbon")
            -- Fix visual selection highlighting for terminal
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                callback = function()
                    vim.cmd("highlight Visual ctermfg=white ctermbg=235 guifg=#ffffff guibg=#262626")
                end,
            })
            vim.cmd("highlight Visual ctermfg=white ctermbg=235 guifg=#ffffff guibg=#262626")
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

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            local noice = require("noice")
            noice.setup({})
            --    noice.setup({
            --        cmdline = { enabled = false },
            --        messages = { enabled = false },
            --    })
        end,
    },

    {
        "hrsh7th/cmp-cmdline",
        config = function()
            local cmp = require("cmp")
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                }),
            })
        end,
    },

    -- {
    --     url = "ssh://git.amazon.com/pkg/AmazonQNVim",
    --     config = function()
    --         local aqnvim = require("amazonq")
    --         aqnvim.setup({ ssoStartUrl = "https://amzn.awsapps.com/start" })
    --     end,
    -- },

    "eandrju/cellular-automaton.nvim",
})
