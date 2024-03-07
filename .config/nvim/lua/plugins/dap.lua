local M = {}


function M.setup()
    -- setup adapters
    -- require("dap-vscode-js").setup({
    --     debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
    --     debugger_cmd = { "js-debug-adapter" },
    --     -- adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    -- })

    local dap = require("dap")
    require("dap-ruby").setup()
    --
    -- local js_based_languages = { "typescript", "javascript", "typescriptreact" }
    --
    -- for _, language in ipairs(js_based_languages) do
    --     require("dap").configurations[language] = {
    --         {
    --             type = "pwa-node",
    --             request = "launch",
    --             name = "Launch file",
    --             program = "${file}",
    --             cwd = "${workspaceFolder}",
    --         },
    --         {
    --             type = "pwa-node",
    --             request = "attach",
    --             name = "Attach",
    --             processId = require "dap.utils".pick_process,
    --             cwd = "${workspaceFolder}",
    --         },
    --         {
    --             type = "pwa-chrome",
    --             request = "launch",
    --             name = "Start Chrome with \"localhost\"",
    --             url = "http://localhost:3000",
    --             webRoot = "${workspaceFolder}",
    --             userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
    --         },
    --     }
    -- end

    vim.keymap.set("n", "<F6>", function() require("dap").continue() end)
    vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
    vim.keymap.set("n", "<Leader>B", function() require("dap").toglle_breakpoint() end)
end

return M
