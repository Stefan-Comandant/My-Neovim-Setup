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

-- lspconfig.lua_ls.setup {
--     settings = {
--         -- lua LSP
--         Lua = {
--             runtime = {
--                 version = 'LuaJIT',
--                 path = vim.split(package.path, ';')
--             },
--             diagnostics = {
--                 globals = {'vim'}
--             },
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false
--             },
--             telemetry = {
--                 enable = false
--             }
--         }
--     },
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }


lspconfig.lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}
