local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


local function on_attach(client,bufnr)
    require"lsp_signature".on_attach({
        bind = true,
        floating_window = true,
        hint_enable = false,
    }, bufnr)
end

return { lspconfig = lspconfig, capabilities = capabilities, on_attach = on_attach}
