-- TODO_MM: sort out, categorize and comment all mappings
map { "*", "Don't jump on * (search word under cursor)", "<Cmd>keepjumps normal! mi*`i<CR>", mode = "n" }
map {
    "*",
    "Don't jump on * (search selection)",
    [["*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>]],
    mode = "v",
}

vim.keymap.set("i", "jj", "<Esc>", { silent = true })
vim.keymap.set("i", "JJ", "<Esc>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "t" }, "Q", ":qa<CR>", { silent = true }) -- exit vim
vim.keymap.set("n", "qd", ":q<CR>", { silent = true })               -- close winDow
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })

-- Copy & paste to system clipboard
-- makes sense only if not used set clipboard=unnamedplus
vim.keymap.set("v", "<A-y>", "\"+y", { silent = true })
vim.keymap.set("v", "<A-d>", "\"+d", { silent = true })
vim.keymap.set("v", "<A-p>", "\"+p", { silent = true })
vim.keymap.set("n", "<A-d><A-d>", "\"+dd", { silent = true })
vim.keymap.set("n", "<A-p>", "\"+p", { silent = true })

-- -- [[ Navigation ]] -- --

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
-- Indentation
vim.keymap.set("n", "<A-l>", ">>", { silent = true })
vim.keymap.set("n", "<A-h>", "<<", { silent = true })
vim.keymap.set("v", "<A-l>", ">gv", { silent = true })
vim.keymap.set("v", "<A-h>", "<gv", { silent = true })
-- Selection
vim.keymap.set("n", "<C-a><C-a>", "ggVG<CR>", { silent = true }) -- select all
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true })   -- clean all selections
vim.keymap.set("v", "<A-.>", ":t'><CR>", { silent = true })      -- duplicate selection
-- Buffers. Also adds a scope to buffers browsing within window
-- (so next and prev buffers commands below are taken only from the current window)
vim.keymap.set("n", "<A-u>", ":BufstopBack<CR>", { silent = true })
vim.keymap.set("n", "<A-m>", ":BufstopForward<CR>", { silent = true })
-- Bufkill plugin mapping
vim.keymap.set("n", "qq", ":BD<CR>", { silent = true })
-- vim-rails
vim.keymap.set("n", "ra", ":A<CR>", { silent = true }) -- switch to spec
-- go to beginning/end of line
vim.keymap.set("n", "<End>", "$", { silent = true })
vim.keymap.set("n", "<Home>", "0", { silent = true })
vim.keymap.set("v", "<End>", "$", { silent = true })
vim.keymap.set("v", "<Home>", "0", { silent = true })
-- add empty line above/below
vim.keymap.set("n", "<CR>j", ":<C-u>normal! o<CR>", { silent = true })
vim.keymap.set("n", "<CR>k", ":<C-u>normal! O<CR>", { silent = true })
-- Cut to underscores
vim.keymap.set("n", "cu", "ct_", { silent = true })
vim.keymap.set("n", "c2u", "c2t_", { silent = true })
vim.keymap.set("n", "c3u", "c3t_", { silent = true })

-- -- [[ Files ]] -- --
vim.keymap.set("n", "<C-f><C-r>", ":e!<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fot", ":e ./_mydev/temp.md<CR>", { silent = true })
-- filenames copying
vim.keymap.set("n", "<A-f>pa", ":let @+ = expand('%:p')<CR>", { silent = true }) -- absulute
vim.keymap.set("n", "<A-f>pr", ":let @+ = expand('%')<CR>", { silent = true })   -- relative
vim.keymap.set("n", "<A-f>pf", ":let @+ = expand('%:t')<CR>", { silent = true }) -- filename

-- -- [[ LSP ]] -- --

vim.keymap.set("n", "do", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end)

-- -- [[ Terminal ]] -- --

local function open_or_switch_to_terminal()
    local term_tab_index = -1

    -- loop through tabs to find terminal
    for i = 1, vim.fn.tabpagenr("$") do
        if vim.fn.tabpagewinnr(i, "$") == 1 and
            vim.fn.getbufvar(vim.fn.tabpagebuflist(i)[1], "&buftype") == "terminal" then
            term_tab_index = i
            break
        end
    end

    -- if terminal tab found, switch to it
    if term_tab_index > -1 then
        vim.cmd("tabn " .. term_tab_index)
    else
        vim.cmd("tablast | tabnew | term")
    end
    vim.cmd("startinsert")
end

vim.keymap.set("n", "<A-t><A-t>", open_or_switch_to_terminal, { silent = true }) -- launch terminal
vim.keymap.set("t", "jj", "<C-\\><C-n>", { silent = true })

-- -- [[ Git Status ]] -- --

local function open_or_switch_to_git_status()
    local status_tab_index = -1

    for i = 1, vim.fn.tabpagenr("$") do
        local bufnr = vim.fn.tabpagebuflist(i)[1]
        local filetype = vim.bo[bufnr].filetype

        if vim.fn.tabpagewinnr(i, "$") == 1 and filetype == "fugitive" then
            status_tab_index = i
            break
        end
    end

    -- if tab found, switch to it
    if status_tab_index ~= -1 then
        vim.cmd("tabn " .. status_tab_index)
    else
        vim.cmd("tabnew | Git | wincmd k | q")
    end
end

vim.keymap.set("n", "<A-t><A-g>", open_or_switch_to_git_status, { silent = true })

-- -- [[ Tabs ]] -- --

vim.keymap.set("n", "<A-t><A-c>", ":tab new<CR>", { silent = true })
vim.keymap.set("n", "<A-t><A-x>", ":tab close<CR>", { silent = true })
vim.keymap.set("n", "<PageDown>", ":tabn<CR>", { silent = true })
vim.keymap.set("n", "<PageUp>", ":tabp<CR>", { silent = true })
vim.keymap.set("n", "<A-t><A-a>", "1gt", { silent = true })
vim.keymap.set("n", "<A-t><A-s>", "2gt", { silent = true })
vim.keymap.set("n", "<A-t><A-d>", "3gt", { silent = true })
vim.keymap.set("n", "<A-t><A-f>", "4gt", { silent = true })

-- -- [[ Windows ]] -- --

vim.keymap.set("n", "sp", ":sp<CR>", { silent = true })       -- split horizontal
vim.keymap.set("n", "sv", ":vsp<CR>", { silent = true })      -- split vertical
vim.keymap.set("n", "so", ":only<CR>", { silent = true })     -- leave only current window
vim.keymap.set("n", "sq", ":close<CR>", { silent = true })    -- close window
vim.keymap.set("n", "sh", "<c-w>h", { silent = true })        -- switch to left
vim.keymap.set("n", "sl", "<c-w>l", { silent = true })        -- switch to right
vim.keymap.set("n", "sj", "<c-w>j", { silent = true })        -- switch to down
vim.keymap.set("n", "sk", "<c-w>k", { silent = true })        -- switch to up
vim.keymap.set("n", "st", "<c-w><c-w>", { silent = true })    -- switch between recent
vim.keymap.set("n", "smm", "<c-w>_", { silent = true })       -- maximize current
vim.keymap.set("n", "smj", "<c-w>j<c-w>_", { silent = true }) -- maximize bottom
vim.keymap.set("n", "smk", "<c-w>k<c-w>_", { silent = true }) -- maximize up
vim.keymap.set("n", "sd", "<c-w>=", { silent = true })        -- revert maximize (d - default)
vim.keymap.set("n", "sr", "<c-w>r", { silent = true })        -- rotate
vim.keymap.set("n", "sH", "<c-w>H", { silent = true })        -- horizontal => vertical
vim.keymap.set("n", "sK", "<c-w>K", { silent = true })        -- vertical => horizontal
-- resizing
vim.keymap.set("n", "<right>", ":5wincmd ><CR>", { silent = true })
vim.keymap.set("n", "<left>", ":5wincmd <<CR>", { silent = true })
vim.keymap.set("n", "<up>", ":3wincmd +<CR>", { silent = true })
vim.keymap.set("n", "<down>", ":3wincmd -<CR>", { silent = true })

-- -- [[ Spellcheck ]] -- --

vim.keymap.set("n", "<A-s><A-r>", ":set spelllang=ru_yo<CR>", { silent = true }) -- RU
vim.keymap.set("n", "<A-s><A-e>", ":set spelllang=en_us<CR>", { silent = true }) -- EN
local function ToggleSpellCheck()
    -- Toggle the 'spell' option
    vim.cmd("set spell!")

    -- Check the state of the 'spell' option and echo the corresponding message
    if vim.o.spell then
        print("Spellcheck ON")
    else
        print("Spellcheck OFF")
    end
end
vim.keymap.set("n", "<A-s><A-t>", ToggleSpellCheck, { silent = true })

-- -- [[ Misc ]] -- --

vim.keymap.set("n", "<A-n><A-n>", ":set nornu<CR>", { silent = true })  -- absolute line numbers
vim.keymap.set("n", "<A-n><A-r>", ":set rnu<CR>", { silent = true })    -- relative line numbers
vim.keymap.set("n", "<A-r><A-r>", ":%s/", { silent = true })            -- replace text
vim.keymap.set("n", "<A-r><A-w>", ":%s/<C-r><C-w>/", { silent = true }) -- replace word under cursor
-- replace selection
vim.keymap.set("v", "<A-r><A-w>", "\"sy:%s/<C-r>=substitute(@s, '\\n', '', 'g')<cr>/", { silent = true })
vim.keymap.set("n", "<A-f><A-f>", ":b#<CR>", { silent = true }) -- swetch between last two buffers
-- make <F9> work in vim the same way as in ubuntu UI
vim.keymap.set("n", "<F9>", ":call system('copyq toggle')<CR>", { silent = true })
-- <C-o> is a temp switch to normal mode for insert
vim.keymap.set("i", "<F9>", "<C-o>:call system('copyq toggle')<CR>", { silent = true })
-- <C-\><C-n> is a temp switch to normal mode for terminal
vim.keymap.set("t", "<F9>", "<C-\\><C-n>:call system('copyq toggle')<CR>", { silent = true })
