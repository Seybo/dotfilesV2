local M = {}

function M.setup()
    local mason = require "mason"
    local mason_cfg = require "mason-lspconfig"
    local lsp_cfg = require "lspconfig"
    local neodev = require "neodev"

    mason.setup {}

    mason_cfg.setup {
        ensure_installed = {
            "cssls",
            "html",
            "jsonls",
            "lua_ls",
            "rubocop",
            "solargraph",
            "tsserver",
            "vimls",
            "yamlls",
            "eslint",
        },
    }

    -- js
    lsp_cfg.tsserver.setup {}
    lsp_cfg.eslint.setup {
        settings = {
            eslint = {
                autoformat = true,
            },
        },
    }

    -- lua
    neodev.setup {}
    lsp_cfg.lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = { -- fixes "LSP[lua_ls][Info] Too large file:" and broken undo history
                    preloadFileSize = 5000,
                    -- to get rid of "Do you need to configure your work environment as `luv`?"
                    checkThirdParty = false,
                },
            },
        },
    }

    -- ruby
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#solargraph
    lsp_cfg.solargraph.setup {
        cmd = { "rbenv", "exec", "solargraph", "stdio" },
        root_dir = lsp_cfg.util.root_pattern("Gemfile", ".git", "."),
        init_options = {
            autoformat = true,
            formatting = true,
        },
        settings = {
            solargraph = {
                useBundler = true,
                autoformat = true,
                completion = true,
                diagnostic = true,
                formatting = true,
                folding = true,
                references = true,
                rename = true,
                symbols = true,
                definitions = true,
                hover = true,
            },
        },
    }
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rubocop
    lsp_cfg.rubocop.setup {
        cmd = { "rbenv", "exec", "bundle", "exec", "rubocop", "--lsp" },
    }
end

return M
