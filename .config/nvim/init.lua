vim.g.mapleader = " " -- must be set prior plugins initialization

require "utils.map"   -- should go first as defines global mapping function
require "plugins"
require "mappings"
require "settings"
require "utils.autoload"
require "theme"
require "autocommands"

require "colorizer".setup() -- TODO_MM: for some reason it doesnt work in the plugin config
vim.o.path = vim.o.path .. ",_mydev/**"
-- [[ Tips ]]
-- You can use :source $VIMRUNTIME/syntax/hitest.vim to see all highlighting groups.
-- You can use :lua print(vim.inspect(require('ayu.colors'))) command to check all available colors.
-- To see all the hightligt groups: :highlight
-- To see the color of element under cursor: :Inspect
-- To update the color returned by :Inspect update what it says it "links to": hi @variable guifg=#FF0000
