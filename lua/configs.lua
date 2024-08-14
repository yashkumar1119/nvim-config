-- Configurations (Plugins & Neovim)


-- LSP
local lspconfig = require('lspconfig')

local lsp_servers = {
	'gopls',
	'clangd',
	'pyright',
	'tsserver',
	'rust_analyzer',
	'lua_ls',
	'jdtls',
	'sourcekit',
}

local function setup_lsp_servers()
	for _, server in ipairs(lsp_servers) do
		lspconfig[server].setup {}
	end
end

setup_lsp_servers()

-- Treesitter
require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = { "c", "lua", "python", "javascript" }, -- or "all"

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- Harpoon 

local harpoon = require('harpoon')

-- Set up Harpoon
harpoon.setup({
    global_settings = {
        -- set marks on startup
        marks = {
            -- maximum number of marks per file
            max_marks = 15,
        },
    },
})

-- Completions
-- configs.lua

local cmp = require('cmp')
local lspkind = require('lspkind')  -- Optional, for icons in completions
local luasnip = require('luasnip')

-- Setup nvim-cmp.
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- For luasnip users.
        end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,  -- show text alongside icons
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
                cmdline = "[Cmdline]",
            },
        }),
    },
})

-- Setup cmp for command line
cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
        { name = 'path' },
    }
})

-- Setup lua_ls with nvim-cmp
require('lspconfig').lua_ls.setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- File Tree 

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Lualine 
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
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
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

-- Toggle Tree 
-- init.lua or settings.lua

require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
    return 20
  end,

  open_mapping = nil,
  direction = 'horizontal', -- Use 'vertical', 'horizontal', 'tab', or 'float'

  start_in_insert = true,
  auto_scroll = true,
  close_on_exit = true,
  hide_numbers = true,

  highlights = {
    Normal = {
      guibg = "#1e1e1e", -- Example background color
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guifg = "#ff0000", -- Example border color
      guibg = "#1e1e1e", -- Example background color
    },
  },

  float_opts = {
    border = 'single', -- Use 'single', 'double', 'shadow', or 'curved'
    width = 80,
    height = 20,
    winblend = 3,
    zindex = 10,
    title_pos = 'left',
  },
}

-- Icons

local devicons = require('nvim-web-devicons')

devicons.setup {
  default = true;

  -- Customize folder icons
  icons = {
    folder = {
      icon = "", -- Folder icon
      color = "#7a8a4d", -- Muted green color
      name = "Folder",
    },
    folder_open = {
      icon = "", -- Opened folder icon
      color = "#7a8a4d", -- Muted green color
      name = "FolderOpen",
    },
    folder_symlink = {
      icon = "", -- Symlink folder icon
      color = "#7a8a4d", -- Muted green color
      name = "FolderSymlink",
    },
  },
}

