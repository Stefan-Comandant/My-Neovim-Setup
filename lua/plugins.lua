return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'
    use 'nvim-tree/nvim-tree.lua'
    use 'akinsho/bufferline.nvim'
    use 'haishanh/night-owl.vim'
    use 'windwp/nvim-autopairs'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'mg979/vim-visual-multi'
    use 'tpope/vim-commentary'
    use 'kylechui/nvim-surround'

    use {
        'hrsh7th/nvim-cmp', -- Completion framework
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'hrsh7th/cmp-buffer', -- Buffer completions
        'hrsh7th/cmp-path', -- Path completions
        'hrsh7th/cmp-cmdline', -- Command line completions
        'L3MON4D3/LuaSnip' -- Snippet engine
    }
end)

