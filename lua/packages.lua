-- Packages & useins


return require('packer').startup(function(use)

	-- Packer
	use 'wbthomason/packer.nvim'

	-- LSP
	use 'neovim/nvim-lspconfig'

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Harpoon
	use 'ThePrimeagen/harpoon'

	-- Completions
	use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp'     -- LSP completions
	use 'hrsh7th/cmp-buffer'       -- Buffer completions
	use 'hrsh7th/cmp-path'         -- Path completions
	use 'hrsh7th/cmp-cmdline'      -- Cmdline completions
	use 'L3MON4D3/LuaSnip'         -- Snippet engine
	use 'saadparwaiz1/cmp_luasnip' -- LuaSnip completions
	use 'onsails/lspkind.nvim'

	-- Tokyo Night
	use 'folke/tokyonight.nvim'

	-- Moonlight
	use 'shaunsingh/moonlight.nvim'

    -- Everforest
    use 'sainnhe/everforest'

    -- Base16 Sandcastle
    use 'chriskempson/base16-vim'

	-- Lualine 
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

    -- Auto Pair
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }


    -- Autosave
    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })

    -- Undo Tree
    use 'mbbill/undotree'

end)

