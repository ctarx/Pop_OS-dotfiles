-- nvim/lua/options.lua

vim.o.backspace = '2'
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.autoread = true

-- Tab
vim.o.tabstop = 2              -- number of visual spaces per TAB
vim.o.shiftwidth = 2           -- insert 2 spaces on a TAB
vim.o.shiftround = true        -- maintains aligment during text shifting
vim.o.expandtab = true         -- tabs are spaces (because of python)

vim.cmd [[ set noswapfile ]]

--Line numbers
vim.o.number = true

vim.o.title = true
vim.o.fileencoding = "utf-8"
vim.o.scrolloff = 8

vim.o.mouse = 'a'

vim.o.termguicolors = true

-- allows neovim to access the system clipboard
vim.o.clipboard = "unnamedplus"
