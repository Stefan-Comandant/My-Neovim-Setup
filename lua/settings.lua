vim.opt.clipboard = 'unnamedplus'
vim.opt.guicursor = "n:block,ci:block,i:block,r:block,o:block"
vim.opt.showtabline = 1

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
	    source = "always",
    },
})

vim.cmd[[colorscheme night-owl]]

vim.wo.number = true

require('nvim-tree').setup {
    view = {
    	side = 'left',
	width = 30,
	-- auto_resize = true,
    },
    actions = {
	open_file = {
	    quit_on_open = false,
	    window_picker = {
		enable = false,
	    },
	}
    },
    -- Enable icons (if 'nvim-web-devicons' is installed)
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true
           }
        }
    }
}

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        local args = vim.fn.argv()
        if #args == 1 then
            local path = args[1]
            local is_dir = vim.fn.isdirectory(path) == 1
            if is_dir then
                -- Toggle nvim-tree if a directory is opened
                require('nvim-tree').toggle()
            end
        end
    end,
})

-- vim.api.nvim_exec([[
--     autocmd VimEnter * NvimTreeOpen
-- ]], false)

require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",  -- Show LSP diagnostics in the tabline
    separator_style = "slant",  -- Choose a tab separator style
    show_buffer_close_icons = false,
    show_close_icon = false,
    enforce_regular_tabs = true,
    always_show_bufferline = false, -- Only show tabs when more than one buffer is open
  }
}
local npairs = require('nvim-autopairs')
npairs.setup({
    -- Add any specific configuration options here if needed
})
