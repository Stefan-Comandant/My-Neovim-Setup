local common = require(".lsp.common")
local lspconfig = common.lspconfig
local on_attach = common.on_attach
local capabilities = common.capabilities

lspconfig.asm_lsp.setup({
    cmd = { "asm-lsp" },
    assembler = "nasm",
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "asm" }
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         on_attach(_, args.buf)
--     end,
-- })

lspconfig.clangd.setup({
    cmd = {
        "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed",
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = true,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- vim.lsp.enable()
-- vim.lsp.config("lua_ls", {
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
--             -- workspace = {
--                 --     library = vim.api.nvim_get_runtime_file("", true),
--                 --     checkThirdParty = false
--                 -- },
--                 telemetry = {
--                     enable = false
--                 }
--             }
--         },
--         capabilities = capabilities,
--         on_attach = on_attach,
--         on_init = function (client, _)
--             if client.supports_method "textDocument/semanticTokens" then
--                 client.server_capabilities.semanticTokensProvider = nil
--             end
--         end
-- })
-- vim.lsp.enable("lua_ls")

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
            -- workspace = {
            --     library = vim.api.nvim_get_runtime_file("", true),
            --     checkThirdParty = false
            -- },
            telemetry = {
                enable = false
            }
        }
    },
    capabilities = capabilities,
    on_attach = on_attach,
    on_init = function (client, _)
        if client.supports_method "textDocument/semanticTokens" then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end
}
