local M = {}

function M.setup()
    require("which-key").setup({
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for keymaps that start with a native binding
            i = { "j", "k" },
            v = { "j", "k" },
            -- glitches on rails models gf
            n = { "g" },
        },
    })
end

return M
