local M = {}

function M.setup()
    require("themes.tokyonight_moon_settings").setup()
    vim.cmd [[colorscheme tokyonight-moon]]
end

return M
