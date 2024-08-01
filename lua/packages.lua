-- Packages & Plugins

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


-- Plugin Manager
return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Language Server Protocol (LSP)
    use 'neovim/nvim-lspconfig'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --Completions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'
    use 'sainnhe/everforest'
    use 'eldritch-theme/eldritch.nvim'
    use 'ThePrimeagen/harpoon'

end)

