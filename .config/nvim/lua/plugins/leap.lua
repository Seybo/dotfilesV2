local M = {}

function M.setup()
    require "leap"

    vim.keymap.set({ "n", "x", "o" }, "ss", "<Plug>(leap-forward-to)")
    vim.keymap.set({ "n", "x", "o" }, "SS", "<Plug>(leap-backward-to)")
end

return M
