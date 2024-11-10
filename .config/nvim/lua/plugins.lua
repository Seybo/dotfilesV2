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

local lazy = require "lazy"

local plugins = {
    -- themes: enable one that is used
    {
        "folke/tokyonight.nvim",
        version = "*",
        priority = 1000,
        config = require("theme").setup,
    },
    -- {
    --     "marko-cerovac/material.nvim",
    --     version = "*",
    --     priority = 1000,
    -- },
    -- {
    --     "Shatur/neovim-ayu",
    --     version = "*",
    --     priority = 1000,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     version = "*",
    --     priority = 1000,
    --     config = require("colorschemes.rose-pine").setup,
    -- },

    -- {
    --     "rktjmp/lush.nvim",
    --     branch = "main",
    -- },

    { -- smooth scrolling
        "karb94/neoscroll.nvim",
        version = "*",
        config = require("plugins.neoscroll").setup,
    },

    -- essentials
    { -- whitespace trimming autocommand needs it
        "echasnovski/mini.trailspace",
        version = "*",
        event = "BufEnter",
        config = require("plugins.mini-trailspace").setup,
    },

    {
        "nvim-tree/nvim-web-devicons",
        version = "*",
        config = require("plugins.devicons").setup,
    },

    -- lsp (linting and formatting)
    {
        "williamboman/mason.nvim",
        version = "*",
    },

    {
        "williamboman/mason-lspconfig.nvim",
        version = "*",
    },

    { -- .Configs for Nvim LSP client
        "neovim/nvim-lspconfig",
        event = "BufEnter",
        config = require("plugins.lspconfig").setup,
    },

    {
        "folke/neodev.nvim",
        version = "*",
    },

    { -- sessions management
        "gennaro-tedesco/nvim-possession",
        version = "*",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        config = true,
        init = require("plugins.possession").setup,
    },

    {
        "glepnir/lspsaga.nvim",
        branch = "main", -- TODO_MM: Go back to stable after the current version is released
        event = "BufEnter",
        init = require("plugins.lspsaga").setup,
    },

    { -- vscode-like pictograms for neovim built-in lsp
        "onsails/lspkind-nvim",
        version = "*",
    },

    -- autocompletions
    {
        "hrsh7th/nvim-cmp",
        branch = "main",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "saadparwaiz1/cmp_luasnip",
        },
        config = require("plugins.cmp").setup,
    },

    {
        "github/copilot.vim",
        version = "*",
    },

    -- { -- using fugitive for now
    --     "kdheepak/lazygit.nvim",
    --     version = "*",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim",
    --         "nvim-lua/plenary.nvim",
    --     },
    --     config = function()
    --         require("telescope").load_extension("lazygit")
    --     end,
    -- },

    {
        "L3MON4D3/LuaSnip",
        version = "*",
        event = "BufEnter",
        config = require("plugins.luasnip").setup,
    },

    {
        "folke/todo-comments.nvim",
        version = "*",
        event = "BufEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins.todo-comments").setup,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        event = "BufEnter",
        config = require("plugins.treesitter").setup,
        build = ":TSUpdate",
    },

    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     version = "*",
    --     event = "BufEnter",
    -- },

    -- {
    --     "ziontee113/syntax-tree-surfer",
    --     version = "*",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     event = "BufEnter",
    --     config = require("plugins.syntax-tree-surfer").setup,
    -- },

    {
        "windwp/nvim-autopairs",
        version = "*",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },

    {
        "tpope/vim-rails",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = require("plugins.vim-rails").setup,
    },

    {
        "vim-test/vim-test",
        version = "*",
        config = require("plugins.vim-test").setup,
    },


    -- search/replace
    {
        "nvim-pack/nvim-spectre",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = require("plugins.spectre").setup,
    },

    {
        "ggandor/leap.nvim",
        version = "*",
        event = "BufEnter",
        config = require("plugins.leap").setup,
    },

    {
        "mbbill/undotree",
        version = "*",
        event = "BufEnter",
        config = require("plugins.undotree").setup,
    },

    {
        "ggandor/flit.nvim",
        version = "*",
        event = "BufEnter",
        config = require("plugins.flit").setup,
    },

    -- comments

    {
        "numToStr/Comment.nvim",
        version = "*",
        event = "BufEnter",
        config = require("plugins.comment").setup,
    },

    -- tab & status bar
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = require("plugins.lualine").setup,
    },

    {
        "tpope/vim-fugitive",
        version = "*",
        config = require("plugins.fugitive").setup,
        dependencies = {
            "junegunn/gv.vim",
            "tpope/vim-rhubarb",
        },
    },

    -- { -- not using it for now
    --     "sindrets/diffview.nvim",
    --     version = "*",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     config = require("plugins.diffview").setup,
    -- },


    -- TODO_MM: disabled for now as it often fails on rspecs
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     branch = "main",
    --     event = "BufEnter",
    --     config = require("plugins.gitsigns").setup,
    -- },

    {
        "ludovicchabant/vim-gutentags",
        version = "*",
        config = function()
            -- vim.cmd("set tags+=tags,.git/tags")
            vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_di. '/*')]])
            vim.g.gutentags_enabled = true
            vim.g.gutentags_resolve_symlinks = true
            vim.g.gutentags_ctags_tagfile = "tags"
            vim.g.gutentags_project_root = { ".git" }
            vim.g.gutentags_add_default_project_roots = 0
            vim.g.gutentags_ctags_executable = "/usr/bin/ctags"
            vim.g.gutentags_ctags_extra_args_ruby = { "--ignore-unsupported-options", "--recursive" }
            vim.g.gutentags_generate_on_new = true
            vim.g.gutentags_generate_on_missing = true
            vim.g.gutentags_generate_on_write = true
            vim.g.gutentags_ctags_exclude = {
                "*.git",
                "*.svg",
                "*.node-renderer-bundles",
                "*/spec/*",
                "build",
                "dist",
                "bin",
                "node_modules",
                "cache",
                "compiled",
                "coverage",
                "docs",
                "bundle",
                "vendor",
                "public",
                "*.md",
                "*-lock.json",
                "*.lock",
                "*bundle*.js*",
                "*build*.js*",
                "*spec.rb",
                "*test*.js*",
                ".*rc*",
                "*.json",
                "*.min.*",
                "*.map",
                "*.bak",
                "*.zip",
                "*.pyc",
                "*.tmp",
                "*.cache",
                "tags*",
            }
            -- vim.g.gutentags_trace = 1
        end,
    },

    -- navigation

    { -- improves next/prev buffers to be scoped to window
        "mihaifm/bufstop",
        version = "*",
        event = "BufEnter",
    },

    { -- deleting a buffer no longer closes its window or split
        "qpkorr/vim-bufkill",
        version = "*",
        event = "BufEnter",
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugins.telescope").setup,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = require("plugins.neo-tree").setup,
    },

    { -- fancy indentation with . . .
        "lukas-reineke/indent-blankline.nvim",
        version = "*",
        -- TODO_MM: remove, there is a temp issue with the latest nvim build (fails on load)
        tag = "v3.8.2",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        config = require("plugins.indent-blankline").setup,
    },

    {
        "vimwiki/vimwiki",
        version = "*",
        init = require("plugins.vimwiki").setup,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        -- init = function()
        --     vim.o.timeout = true
        --     vim.o.timeoutlen = 300
        -- end,
        config = require("plugins.which-key").setup,
    },

    -- misc
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = require("plugins.surround").setup,
    },

    {
        "nanozuki/tabby.nvim",
        version = "*",
        config = require("plugins.tabby").setup,
    },

    -- {
    --     "jakewvincent/mkdnflow.nvim",
    --     version = "*",
    --     config = require("plugins.mkdnflow").setup,
    -- },
    {
        "jghauser/follow-md-links.nvim",
        version = "*",
    },

    -- {
    --     "lukas-reineke/headlines.nvim",
    --     dependencies = "nvim-treesitter/nvim-treesitter",
    --     config = true,
    -- },

    {
        "ellisonleao/glow.nvim",
        version = "*",
        config = true,
        cmd = "Glow",
    },
    -- {
    --     "folke/noice.nvim",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     },
    --     config = require("plugins.noice").setup,
    -- },

    -- {
    --     "subnut/nvim-ghost.nvim",
    --     lazy = false,
    --     config = function()
    --         vim.g.nvim_ghost_super_quiet = 1
    --     end,
    -- },

    {
        "norcalli/nvim-colorizer.lua",
        version = "*",
        lazy = true,
        -- config = require("plugins.colorizer").setup,
    },

    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            "kkharji/sqlite.lua",
            "nvim-telescope/telescope.nvim",
        },
        event = { "BufReadPost", "BufNewFile" },
        config = require("plugins.neoclip").setup,
    },

    {
        "windwp/nvim-projectconfig",
    },

    -- database
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            -- "kristijanhusak/vim-dadbod-completion", -- TODO_MM: breaks completion
        },
        config = require("plugins.dadbod").setup,
    },

    -- Debugger

    -- {
    --     "mfussenegger/nvim-dap",
    --     dependencies = {
    --         -- "rcarriga/nvim-dap-ui",
    --         -- "microsoft/vscode-js-debug" is installed via Mason
    --         -- "mxsdev/nvim-dap-vscode-js",
    --     },
    --     config = require("plugins.dap").setup,
    -- },

    --
    -- {
    --     "Pocco81/DAPInstall.nvim",
    --     branch = "dev",
    -- },
    --
    -- {
    --     "nvim-telescope/telescope-dap.nvim",
    -- },
    --
    -- {
    --     "suketa/nvim-dap-ruby",
    -- },

    -- TODO_MM:
    -- Plug 'theHamsta/nvim-dap-virtual-text' -- cannot see virtual text if Treesitter for a language is not installed

    -- my plugins/forks

    {
        dir = "/mnt/dev/my/vim_plugins/stackmap.nvim",
        version = "*",
        event = "VimEnter",
        priority = 1000,
    },

    {
        dir = "/mnt/dev/my/vim_plugins/rose-pine.nvim",
        version = "*",
        priority = 1000,
        config = require("theme").setup,
    },
}

local options = {
    defaults = {
        lazy = false,
    },

    performance = {
        cache = {
            enabled = true,
        },

        rtp = {
            disabled_plugins = {
                "gzip",
                -- "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },

    ui = {
        size = { width = 0.9, height = 0.9 },
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
    },

    checker = {
        -- automatically check for plugin updates
        enabled = false,
    },
}

lazy.setup(plugins, options)
