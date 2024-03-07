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
    {
        "tpope/vim-rails",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = require("plugins.vim-rails").setup,
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
