return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'
    use 'nvim-tree/nvim-tree.lua'
    use 'akinsho/bufferline.nvim'
    use 'catppuccin/nvim'
    use 'windwp/nvim-autopairs'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'mg979/vim-visual-multi'
    use 'tpope/vim-commentary'
    -- use 'kylechui/nvim-surround'
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use { "anuvyklack/windows.nvim",
       requires = {
          "anuvyklack/middleclass",
          "anuvyklack/animation.nvim"
       },
       config = function()
          vim.o.winwidth = 10
          vim.o.winminwidth = 10
          vim.o.equalalways = false
          require('windows').setup()
       end
    }

    use 'nvim-telescope/telescope.nvim'
    use 'vzze/calculator.nvim'
    use 'Djancyp/better-comments.nvim'
    use 'nvim-lualine/lualine.nvim'

    use {
        'hrsh7th/nvim-cmp', -- Completion framework
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'hrsh7th/cmp-buffer', -- Buffer completions
        'hrsh7th/cmp-path', -- Path completions
        'hrsh7th/cmp-cmdline', -- Command line completions
        'L3MON4D3/LuaSnip' -- Snippet engine
    }
end)

