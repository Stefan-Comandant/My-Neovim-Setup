local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('i', '<C-h>', '<Left>', opts);
map('i', '<C-j>', '<Down>', opts);
map('i', '<C-k>', '<Up>', opts);
map('i', '<C-l>', '<Right>', opts);
map('n', '<C-a>', 'ggVG', opts);
map('i', '<C-n>', '<Esc>o<CR>', opts)

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

map('n', '<leader>tn', ':tabnew<CR>', opts) -- New tab
map('n', '<leader>tc', ':tabclose<CR>', opts) -- Close tab
map('n', '<leader>to', ':tabonly<CR>', opts) -- Close all other tabs
map('n', '<leader>tp', ':tabprev<CR>', opts) -- Go to previous tab
map('n', '<leader>tn', ':tabnext<CR>', opts) -- Go to next tab
