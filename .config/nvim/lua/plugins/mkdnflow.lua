local M = {}

function M.setup()
    require("mkdnflow").setup({
        links = {
            conceal = true,
        },
    })
end

return M
