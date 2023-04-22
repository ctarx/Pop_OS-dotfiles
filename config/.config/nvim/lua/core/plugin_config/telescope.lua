require('telescope').setup()
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, { desc = '[F]ind by [G]rep'})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, { desc = '[F]ind [H]elp'})
vim.keymap.set('n', '<Space>fw', builtin.grep_string, { desc = '[F]ind current [W]ord'})

