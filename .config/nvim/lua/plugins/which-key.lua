local M = {}

function M.setup()
    require("which-key").setup({
        delay = 1000,
        triggers = {
            { "<auto>", mode = "nixsotc" },
            { "g",      mode = { "v" } }, -- doesn't seem to work
        },
    })
end

return M
