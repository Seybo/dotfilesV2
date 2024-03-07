local M = {}

-- colors: https://rosepinetheme.com/palette/ingredients/
function M.setup()
    local plugin = require "rose-pine"

    plugin.setup({
        variant = "dawn",

        groups = {
            background = "#fafaf7",
        },
        highlight_groups = {
            -- spectre
            SpectreFile = { fg = "love" },
            SpectreSearch = { bg = "highlight_med", fg = "foam" },
            -- diffview
            DiffAdd = { fg = "love" },
            DiffviewFilePanelFileName = { fg = "foam" },
        },
    })
end

return M
