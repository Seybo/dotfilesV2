local M = {}

function M.setup()
    map { "<Leader>gm", "Fugitive: Git blame", ":Git blame<CR>", mode = { "n" } }
    map { "<Leader>gbb", "Fugitive: Git browse", ":GBrowse<CR>", mode = { "n", "v" } }
    map { "<Leader>gbo", "Fugitive: Git browse origin", ":GBrowse origin:%<CR>", mode = { "n", "v" } }
end

return M
