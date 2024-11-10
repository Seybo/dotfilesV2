local M = {}

function M.setup()
    local plugin = require "ibl"

    plugin.setup {
        indent = {
            char = "⋅",
            -- show dots for all the spaces, don't cap
            smart_indent_cap = false,
        },
    }
end

return M
