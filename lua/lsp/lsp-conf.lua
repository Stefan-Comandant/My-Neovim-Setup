local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


local function on_attach(client,bufnr)
    -- Define key mappings for LSP functions
    local buf_map = function(keys, cmd)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, cmd, { noremap = true, silent = true })
    end

    buf_map('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map('<C-k>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_map('go', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_map('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_map('gl', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>')
    buf_map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    require "lsp_signature".on_attach({
        bind = true,
        floating_window = true,
        hint_enable = false,
    }, bufnr)
end

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't work
    handler_opts = {
        border = "rounded" -- Options include 'single', 'double', 'rounded', 'solid', 'shadow', 'none'
    },
    floating_window = true, -- Show signature help in a floating window
    hint_enable = true, -- Virtual hint on the current line
})
-- .lsp.lsp-conf
require(".lsp.java")
require(".lsp.lua")
require(".lsp.clang")
require(".lsp.asm")
require(".lsp.emmet")
