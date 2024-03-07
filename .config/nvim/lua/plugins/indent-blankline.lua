local M = {}

function M.setup()
    local plugin = require "ibl"

    plugin.setup {
        indent = { char = "⋅" },
    }
end

return M
