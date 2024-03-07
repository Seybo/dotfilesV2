local M = {}

function M.setup()
    local plugin = require "neoclip"

    plugin.setup({
        keys = {
            telescope = {
                i = {
                    select = "<C-;>",
                    paste = "<C-p>",
                    paste_behind = "<C-P>",
                    delete = "<C-d>", -- delete an entry
                    edit = "<C-E>",   -- edit an entry
                    custom = {},
                },
                n = {
                    select = "<C-;>",
                    paste = "<C-p>",
                    paste_behind = "<C-P>",
                    delete = "<C-d>", -- delete an entry
                    edit = "<C-E>",   -- edit an entry
                    custom = {},
                },
            },
        },
    })

    require("telescope").load_extension("neoclip")

    local function clipboard()
        require("telescope").extensions.neoclip.default(require("telescope.themes").get_dropdown {
            initial_mode = "insert",
            previewer = false,
        })
    end

    map { "<C-m><C-m>", "Clipboard manager", clipboard, mode = { "n", "v" } }
end

return M
