local M = {}

function M.setup()
    local plugin = require "nvim-treesitter.configs"

    plugin.setup {
        auto_install = true,
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
        },
        ensure_installed = {
            "bash",
            "css",
            "diff",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "graphql",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "nix",
            "ruby",
            "scss",
            "sql",
            "typescript",
            -- "yaml",
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next = {
                    ["]f"] = "@function.outer",
                    ["]r"] = "@return.outer",
                    ["]b"] = "@block.outer",
                    ["]e"] = "@class.outer",
                    ["]c"] = "@comment.outer",
                    ["]p"] = "@parameter.outer",
                    ["]m"] = "@conditional.outer",
                    ["]an"] = "@assignment.lhs",
                    ["]av"] = "@assignment.rhs",
                    ["]s"] = "@statement.outer",
                    ["]l"] = "@loop.outer",
                    ["]xa"] = "@call.outer",
                    ["]xi"] = "@call.inner",
                },
                goto_previous = {
                    ["[f"] = "@function.outer",
                    ["[r"] = "@return.outer",
                    ["[b"] = "@block.outer",
                    ["[e"] = "@class.outer",
                    ["[c"] = "@comment.outer",
                    ["[p"] = "@parameter.outer",
                    ["[m"] = "@conditional.outer",
                    ["[an"] = "@assignment.lhs",
                    ["[av"] = "@assignment.rhs",
                    ["[s"] = "@statement.outer",
                    ["[l"] = "@loop.outer",
                    ["[xa"] = "@call.outer",
                    ["[xi"] = "@call.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<Leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<Leader>A"] = "@parameter.inner",
                },
            },
        },
    }
end

return M
