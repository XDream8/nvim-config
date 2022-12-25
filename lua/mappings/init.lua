local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- split size adjusting
map('n', '<C-Left>', ':vertical resize +3<CR>', opts)
map('n', '<C-Right>', ':vertical resize -3<CR>', opts)
map('n', '<C-Up>', ':resize +3<CR>', opts)
map('n', '<C-Down>', ':resize -3<CR>', opts)

-- split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- replace all
map('n', 'S', ':%s//g<Left><Left>', opts)

-- map Esc to jj
map('i', 'jj', '<Esc>', opts)

-- Clear search highlighting
map('n', '<leader>c', ':nohl<CR>', opts)

-- tab movement
map('n', '<A-n>', 'gt', opts)
map('n', '<A-p>', 'gT', opts)
map('n', '<A-1>', '1gt', opts)
map('n', '<A-2>', '2gt', opts)
map('n', '<A-3>', '3gt', opts)
map('n', '<A-4>', '4gt', opts)
map('n', '<A-5>', '5gt', opts)
map('n', '<A-6>', '6gt', opts)
map('n', '<A-7>', '7gt', opts)
map('n', '<A-8>', '8gt', opts)
map('n', '<A-9>', '9gt', opts)
map('n', '<A-0>', '0gt', opts)
