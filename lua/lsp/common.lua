local lspconfig = require("lspconfig")
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = { noremap = true, silent = true }

local function on_attach(_,_)
    -- Define key mappings for LSP functions
    -- local buf_map = function(keys, cmd)
    --     vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, cmd, { noremap = true, silent = true })
    -- end
    
    -- Set keymaps that are related to buffer commands
    local map = vim.keymap.set

    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts);
    -- map('n', 'gi',vim.lsp.buf.implementation, opts);
    map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts);
    map('n', 'K', vim.lsp.buf.hover, opts);
    map('n', 'gr', vim.lsp.buf.references, opts);
    map('n', 'go',vim.lsp.buf.type_definition, opts);
    map('n', 'gl', '<cmd>Telescope diagnostics<CR>', opts);
    map('n', '<leader>rn',vim.lsp.buf.rename, opts);
    map('n', '<leader>ca',vim.lsp.buf.code_action, opts);
    map('n', 'fd', vim.diagnostic.open_float, opts);

    require "lsp_signature".setup({
        bind = true, -- This is mandatory, otherwise border config won't work
        handler_opts = {
            border = "rounded" -- Options include 'single', 'double', 'rounded', 'solid', 'shadow', 'none'
        },
        floating_window = true, -- Show signature help in a floating window
        hint_enable = true, -- Virtual hint on the current line
    })
end

return { lspconfig = lspconfig, capabilities = capabilities, on_attach = on_attach}
