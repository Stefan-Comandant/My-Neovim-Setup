
local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
    -- You can customize the settings here
    -- For example, you can specify additional flags:
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
    on_attach = function(client, bufnr)
        -- Define key mappings for LSP functions
        local buf_map = function(keys, cmd)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, cmd, { noremap = true, silent = true })
        end

        buf_map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        buf_map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        buf_map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        buf_map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    end,
})

lspconfig.ts_ls.setup({
    -- Optional settings
    on_attach = function(client, bufnr)
        -- Define key mappings for LSP functions
        local buf_map = function(keys, cmd)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, cmd, { noremap = true, silent = true })
        end

        buf_map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        buf_map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        buf_map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        buf_map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Optional: for integration with nvim-cmp
})

lspconfig.gopls.setup({
    -- Optional settings
    on_attach = function(client, bufnr)
        -- Define key mappings for LSP functions
        local buf_map = function(keys, cmd)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, cmd, { noremap = true, silent = true })
        end

        buf_map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
        buf_map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        buf_map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        buf_map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Optional: for integration with nvim-cmp
})
