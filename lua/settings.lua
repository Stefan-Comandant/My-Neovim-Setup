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

vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })

vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })

vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })

vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })

require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,      -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,     -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false,  -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}
