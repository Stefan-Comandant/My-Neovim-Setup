
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client,bufnr)
    -- Define key mappings for LSP functions
    local buf_map = function(keys, cmd)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, cmd, { noremap = true, silent = true })
    end

    buf_map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    require "lsp_signature".on_attach({
        bind = true,
        floating_window = true,
        hint_enable = false,
    }, bufnr)
end

lspconfig.lua_ls.setup {
    settings = {
        -- lua LSP
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            telemetry = {
                enable = false
            }
        }
    },
    capabilities = capabilities,
}

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
    on_attach = on_attach,
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Optional: for integration with nvim-cmp
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Optional: for integration with nvim-cmp
})

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't work
    handler_opts = {
        border = "rounded" -- Options include 'single', 'double', 'rounded', 'solid', 'shadow', 'none'
    },
    floating_window = true, -- Show signature help in a floating window
    hint_enable = true, -- Virtual hint on the current line
})
