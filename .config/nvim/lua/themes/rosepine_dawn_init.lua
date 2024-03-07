local M = {}

function M.setup()
    require("themes.rosepine_dawn_settings").setup()
    vim.cmd [[colorscheme rose-pine]]
end

return M
