local M = {}

local default_options = { noremap = true, silent = true }

_G.map = function(mapping)
    -- NB!: it is important to remove items in reverse order to avoid shifting
    local cmd = table.remove(mapping, 3)
    local desc = table.remove(mapping, 2)
    local key = table.remove(mapping, 1)

    local mode = mapping.mode or { "n" }
    local msg = mapping.msg

    mapping["mode"] = nil
    mapping["desc"] = desc

    local final_cmd
    if msg then
        final_cmd = function()
            -- Use nvim_echo to show the message
            vim.api.nvim_echo({ { msg, "None" } }, true, {})
            -- Schedule clearing the message after 2 seconds
            vim.defer_fn(function() vim.cmd('echo ""') end, 2000)
            cmd() -- Then execute the command
        end
    else
        final_cmd = cmd
    end

    mapping.mode, mapping.msg = nil, nil
    local options = vim.tbl_extend("force", default_options, mapping)

    vim.keymap.set(mode, key, final_cmd, options)
end
