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
