# Global keymaps that aren't buffer specific

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

map('i', '<C-h>', '<Left>', opts);
map('i', '<C-j>', '<Down>', opts);
map('i', '<C-k>', '<Up>', opts);
map('i', '<C-l>', '<Right>', opts);


map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts);
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts);

map('n', '<leader>c', '<cmd>close<CR>', opts);
map('n', '<leader>x', '<cmd>bdelete!<CR>', opts);

map('n', '<leader>/', ':nohlsearch<CR>', opts) -- Clear search highlights

map('n', '<leader>bb', "<cmd>lua require\"stefan-plugin\".build()<CR>", opts)

-- vim.api.nvim_set_keymap('n', '<leader>gi', "", { callback = function ()
--     require("telescope.builtin").lsp_implementations()
-- end } )

map('n', 'gh', ':Telescope help_tags<CR>', opts);
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>bf', ':Telescope buffers<CR>', opts)
map('n', '<leader>lg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>lwg', ':lua require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()<CR>', opts)

vim.api.nvim_create_user_command("Calculate", 'lua require("calculator").calculate()', { ["range"] = 1, ["nargs"] = 0 })

vim.api.nvim_create_user_command("T", "Telescope", { ["range"] = 3, ["nargs"] = 1 })

map('n', '<leader>E', '<cmd>Calculate<CR>', opts);
map('v', '<leader>E', '<cmd>Calculate<CR>', opts);
