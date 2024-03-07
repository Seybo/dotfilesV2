local M = {}

function M.setup()
    local plugin = require "luasnip"
    local snippets_folder = "~/.config/nvim/lua/snippets/"
    require("luasnip.loaders.from_lua").load({ paths = snippets_folder })

    map { "<C-j>", "Luasnip jump to next input", function() plugin.jump(1) end, mode = { "i", "s" } }
    map { "<C-k>", "Luasnip jump to prev input", function() plugin.jump(-1) end, mode = { "i", "s" } }
    map { "<F6>", "Luasnip edit snippets", require("luasnip.loaders").edit_snippet_files, mode = { "n" } }
end

return M
