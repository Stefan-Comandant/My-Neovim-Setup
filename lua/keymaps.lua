local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('i', '<C-h>', '<Left>', opts);
map('i', '<C-j>', '<Down>', opts);
map('i', '<C-k>', '<Up>', opts);
map('i', '<C-l>', '<Right>', opts);
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', 'gl', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>tc', ':bdelete<CR>', opts) -- Close tab
map('n', '<leader>/', ':nohlsearch<CR>', opts) -- Clear search highlights
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
vim.api.nvim_create_user_command("Calculate", "lua require(\"calculator\").calculate()",
    { ["range"] = 1, ["nargs"] = 0 })
map('v', '<leader>E', ':Calculate<CR>', opts);
map('n', '<leader>E', ':Calculate<CR>', opts);
