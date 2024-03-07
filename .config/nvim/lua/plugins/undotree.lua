local M = {}

function M.setup()
    map { "<F5>", "Undo tree", vim.cmd.UndotreeToggle, mode = { "n" } }
end

return M
