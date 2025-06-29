local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

map('i', '<C-h>', '<Left>', opts);
map('i', '<C-j>', '<Down>', opts);
map('i', '<C-k>', '<Up>', opts);
map('i', '<C-l>', '<Right>', opts);

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts);
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts);
map('n', 'gi', ':Telescope lsp_implementations<CR>', opts);
map('n', 'gh', ':Telescope help_tags<CR>', opts);
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts);
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts);
map('n', 'gl', '<cmd>Telescope diagnostics<CR>', opts);
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts);
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts);


map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts);
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts);
map('n', '<leader>tc', ':bdelete<CR>', opts) -- Close tab
map('n', '<leader>/', ':nohlsearch<CR>', opts) -- Clear search highlights


-- vim.keymap.set('n', '<leader>gi', function ()
--     require("telescope.builtin").lsp_implementations()
-- end, opts)
-- map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts);

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>bf', ':Telescope buffers<CR>', opts)

vim.api.nvim_create_user_command("Calculate", "lua require(\"calculator\").calculate()", { ["range"] = 1, ["nargs"] = 0 })

vim.api.nvim_create_user_command("T", "Telescope", { ["range"] = 2, ["nargs"] = 1 })

map('v', '<leader>E', ':Calculate<CR>', opts);
map('n', '<leader>E', ':Calculate<CR>', opts);
