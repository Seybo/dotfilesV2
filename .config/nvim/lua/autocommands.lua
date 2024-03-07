local autocmds = {
    -- TODO_MM: remove if no issues anymore
    --
    -- {
    --     { "Filetype" },
    --     {
    --         pattern = "markdown",
    --         command = "lua vim.b.minitrailspace_disable = true",
    --     },
    -- },
    { -- autoformat on save
        { "BufWritePre" },
        {
            pattern = "*",
            callback = function()
                local filetype = vim.bo.filetype
                local clients = vim.lsp.get_clients()

                local client

                for _, c in ipairs(clients) do
                    if c.config ~= nil and c.config.filetypes ~= nil then
                        for _, ft in ipairs(c.config.filetypes) do
                            if ft == filetype then
                                client = c
                                break
                            end
                        end
                    end

                    if client then
                        break
                    end
                end

                if client then -- format by lsp
                    vim.lsp.buf.format { async = false }
                else           -- just remove trailing whitespaces
                    local bufname = vim.fn.expand "<afile>"
                    local bufnr = vim.fn.bufnr(bufname)

                    if bufnr == -1 then return end

                    local modifiable = vim.api.nvim_buf_get_option(bufnr, "modifiable")

                    if modifiable then
                        local trimmer = require "mini.trailspace"

                        vim.api.nvim_buf_set_lines(0, 0, vim.fn.nextnonblank(1) - 1, true, {})

                        if filetype ~= "markdown" then
                            trimmer.trim()
                        end

                        trimmer.trim_last_lines()
                    end
                end
            end,
        },
    },

    { -- lsp diagnostics popup window auto-open
        { "CursorHold" },
        {
            pattern = "*",
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = "rounded",
                    source = "always",
                    prefix = "🔔 ",
                    scope = "cursor",
                }
                vim.diagnostic.open_float(nil, opts)
            end,
        } },

    { -- disable line numbers in teminal windows
        { "TermOpen" },
        {
            pattern = "*",
            command = "setlocal norelativenumber nonumber",
        },
    },

    {
        { "BufRead" },
        {
            pattern = ".pryrc",
            command = "set filetype=ruby",
        },
    },
}

-- START: ad-hoc fold methods
local foldmethod_map = {
    ["aloha_pushes.rb"] = "indent",
}

local foldmethod_autocmds = {}
for filename, foldmethod in pairs(foldmethod_map) do
    table.insert(foldmethod_autocmds, {
        { "BufRead" },
        {
            pattern = filename,
            command = "setlocal foldmethod=" .. foldmethod,
        },
    })
end

for _, cmd in ipairs(foldmethod_autocmds) do
    table.insert(autocmds, cmd)
end
-- END: ad-hoc fold methods


for _, x in ipairs(autocmds) do
    for _, event in ipairs(x[1]) do
        vim.api.nvim_create_autocmd(event, x[2])
    end
end
