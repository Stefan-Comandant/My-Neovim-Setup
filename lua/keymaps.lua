local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function open_new_line()
    -- Exit insert mode and execute 'o' command in normal mode
    vim.cmd('stopinsert')
    vim.cmd('normal! o')
end

map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('i', '<C-h>', '<Left>', opts);
map('i', '<C-j>', '<Down>', opts);
map('i', '<C-k>', '<Up>', opts);
map('i', '<C-l>', '<Right>', opts);
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
map('i', '<C-CR>', '', { noremap = true, silent = true, callback = open_new_line })
map('n', '<leader>tn', ':tabnew<CR>', opts) -- New tab
map('n', '<leader>tc', ':tabclose<CR>', opts) -- Close tab
map('n', '<leader>to', ':tabonly<CR>', opts) -- Close all other tabs
map('n', '<leader>tp', ':tabprev<CR>', opts) -- Go to previous tab
map('n', '<leader>tn', ':tabnext<CR>', opts) -- Go to next tab
map('n', '<leader>/', ':nohlsearch<CR>', opts) -- Clear search highlights
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', "+", "<C-a>", opts);
map('n', "-", "<C-x>", opts);

vim.api.nvim_create_user_command("Calculate", "lua require(\"calculator\").calculate()",
    { ["range"] = 1, ["nargs"] = 0 })

map('v', '<leader>E', ':Calculate<CR>', opts);
map('n', '<leader>E', ':Calculate<CR>', opts);
