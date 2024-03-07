-- this doesn't work as a local function and it is related to visual selections
function _G.mm_from_rails_sql_to_psql()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Concatenate lines within the range
    local concatenated = ""
    for i = start_line, end_line do
        local line = vim.fn.getline(i)
        concatenated = concatenated .. line
    end

    -- Replace the range with the concatenated line
    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, { concatenated })

    -- Get the new line
    local current_line = vim.api.nvim_get_current_line()

    -- Replace backslash-double quote with just double quote
    local modified_line = current_line:gsub('\\"', '"')

    -- Set the modified line
    vim.api.nvim_set_current_line(modified_line)
end

vim.api.nvim_set_keymap("n", "<Leader>Fp", ":lua mm_from_rails_sql_to_psql()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<Leader>Fp", ":lua mm_from_rails_sql_to_psql()<CR>",
    { noremap = true, silent = true })
