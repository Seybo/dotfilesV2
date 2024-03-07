local M = {}

function M.setup()
    local plugin = require "neoscroll"

    plugin.setup({
        easing_function = "quadratic", -- Default easing function
        -- Set any other options as needed
    })
end

return M
