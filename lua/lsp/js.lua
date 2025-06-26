local common = require(".lsp.common")
local lspconfig = common.lspconfig
local on_attach = common.on_attach
local capabilities = common.capabilities

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
