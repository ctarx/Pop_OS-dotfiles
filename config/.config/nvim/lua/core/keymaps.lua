-- Navigate vim panels better 
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Disable search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs --
vim.keymap.set("n", "<m-t>", ":tabnew %<cr>")
vim.keymap.set("n", "<m-y>", ":tabclose<cr>")
vim.keymap.set("n", "<m-\\>", ":tabonly<cr>")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv')

-- Save file
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")

