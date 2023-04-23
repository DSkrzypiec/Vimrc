vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- completion
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'bluz71/vim-moonfly-colors'

    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("toggleterm").setup()
    end}
    use 'fatih/vim-go'
    use 'ziglang/zig.vim'
    use 'ervandew/supertab'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'nvim-telescope/telescope.nvim'
    use {'hkupty/iron.nvim'}
    use 'fxn/vim-monochrome'
    use 'tpope/vim-fugitive'
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
end)
