local common = require(".lsp.common")
local lspconfig = common.lspconfig
local on_attach = common.on_attach
local capabilities = common.capabilities

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
    on_attach = on_attach,
    capabilities = capabilities,
})
