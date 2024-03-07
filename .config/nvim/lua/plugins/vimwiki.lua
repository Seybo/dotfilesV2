local M = {}

function M.setup()
    vim.g.vimwiki_list = {
        {
            path   = "~/Dropbox/@docs/wiki/dev/",
            syntax = "markdown",
            ext    = ".md",
        },
        {
            path   = "~/Dropbox/@docs/wiki/ubuntu/",
            syntax = "markdown",
            ext    = ".md",
        },
        {
            path   = "~/Dropbox/@docs/wiki/nvim/",
            syntax = "markdown",
            ext    = ".md",
        },
        -- { not using it atm
        --     path   = "~/Dropbox/@docs/wiki/design/",
        --     syntax = "markdown",
        --     ext    = ".md",
        -- },
        {
            path   = "~/Dropbox/@docs/wiki/other/",
            syntax = "markdown",
            ext    = ".md",
        },
        {
            path   = "~/Dropbox/@docs/wiki/thoughts/",
            syntax = "markdown",
            ext    = ".md",
        },
    }
    vim.g.vimwiki_global_ext = 0

    map { "<A-v><A-w>", "Search toggle", ":VimwikiUISelect<CR>", mode = { "n" } }
end

return M
