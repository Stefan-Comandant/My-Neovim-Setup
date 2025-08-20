vim.opt.clipboard = 'unnamedplus'
vim.opt.guicursor = "n:block,ci:block,i:ver1,r:block,o:block"
vim.opt.showtabline = 1

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.wo.relativenumber = true
vim.o.smartindent = true
vim.opt.cursorline = true


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

-- vim.cmd[[colorscheme gruvbox-material]]

-- require("colorizer").setup()
-- vim.opt.termguicolors = nil


require("mason").setup()


require("NeoSolarized").setup({
    style = "dark", -- "dark" or "light"
    transparent = false, -- true/false; Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
    styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        string = { italic = true },
        underline = true, -- true/false; for global underline
        undercurl = true, -- true/false; for global undercurl
    },
    -- Add specific hightlight groups
    on_highlights = function(highlights, colors) 
        -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
    end,
})

require("onedark").setup {
    style = "darker",
    transparent = true,
}

vim.wo.number = true

require('nvim-tree').setup {
    view = {
        side = 'right',
        width = 30,
        preserve_window_proportions = true,
        -- auto_resize = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = true,
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
    },
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    sync_root_with_cwd = true,
    hijack_cursor = true,
}

require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",  -- Show LSP diagnostics in the tabline
        separator_style = "slant",  -- Choose a tab separator style
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = true,
        always_show_bufferline = true, -- Only show tabs when more than one buffer is open
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
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

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require('better-comment').Setup({
    tags = {
        {
            name = "TODO",
            fg = "white",
            bg = "#0a7aca",
            bold = true,
            virtual_text = "",
        },
        {
            name = "FIX",
            fg = "white",
            bg = "#f44747",
            bold = true,
            virtual_text = "This is virtual Text from FIX",
        },
        {
            name = "WARNING",
            fg = "#FFA500",
            bg = "",
            bold = false,
            virtual_text = "",
        },
        {
            name = "!",
            fg = "#f44747",
            bg = "",
            bold = true,
            virtual_text = "",
        }

    }
})

require("themery").setup({
    themes = {
        {
            name = "Gruvbox Dark",
            colorscheme = "gruvbox-material",
            before = [[
            vim.opt.background = "dark"
            ]]
        },
        {
            name = "Retro Box",
            colorscheme = "retrobox",
        },
        {
            name = "Retro Theme",
            colorscheme = "retro-theme",
            after = [[
                require("retro-theme").setup {
                        italic_comments = true,
                    }
                ]],
            },
            {
                name = "Catppuccin",
                colorscheme = "catppuccin",
                after = [[
                vim.opt.background = "dark"
                ]]
            },
            {
                name = "Nord", colorscheme = "nord",
            },
            {
                name = "One dark", colorscheme = "onedark",
                after = [[
                require('onedark').setup {
                    style = 'darker'
                }
                require('onedark').load()
                ]],
            },
            {
                name = "Solarized Dark",
                colorscheme = "NeoSolarized",
                before = [[
                require("NeoSolarized").setup {
                    style = "dark", -- "dark" or "light"
                    transparent = false, -- true/false; Enable this to disable setting the background color
                    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                    enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
                    styles = {
                        -- Style to be applied to different syntax groups
                        comments = { italic = true },
                        keywords = { italic = true },
                        functions = { bold = true },
                        variables = {},
                        string = { italic = true },
                        underline = true, -- true/false; for global underline
                        undercurl = true, -- true/false; for global undercurl
                    },
                    -- Add specific hightlight groups
                    on_highlights = function(highlights, colors) 
                        -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
                    end, 
                }
                ]],
                after = [[
                vim.opt.background = "dark"
                ]]
            },
            {
                name = "Gruvbox Light",
                colorscheme = "gruvbox-material",
                before = [[
                vim.opt.background = "light"
                ]]
            },
            {
                name = "Solarized Light",
                colorscheme = "NeoSolarized",
                before = [[
                require("NeoSolarized").setup {
                    style = "light", -- "dark" or "light"
                    transparent = false, -- true/false; Enable this to disable setting the background color
                    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                    enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
                    styles = {
                        -- Style to be applied to different syntax groups
                        comments = { italic = true },
                        keywords = { italic = true },
                        functions = { bold = true },
                        variables = {},
                        string = { italic = true },
                        underline = true, -- true/false; for global underline
                        undercurl = true, -- true/false; for global undercurl
                    },
                    -- Add specific hightlight groups
                    on_highlights = function(highlights, colors) 
                        -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
                    end, 
                }
                ]],
                after = [[
                vim.opt.background="light"
                ]]
            },
        }, -- Your list of installed colorschemes.
        livePreview = true, -- Apply theme while picking. Default to true.
    })
