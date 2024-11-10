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
    { -- whitespace trimming autocommand needs it
        "echasnovski/mini.trailspace",
        version = "*",
        event = "BufEnter",
        config = require("plugins.mini-trailspace").setup,
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
}

local options = {
    defaults = {
        lazy = false,
    },

    checker = {
        -- automatically check for plugin updates
        enabled = false,
    },
}

lazy.setup(plugins, options)
