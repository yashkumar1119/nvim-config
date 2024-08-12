-- Settings


-- Enable normal and relative line numbers 
vim.wo.number = true
vim.wo.relativenumber = true

-- Tabs 
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Scrolling
vim.o.scrolloff = 10
vim.o.sidescrolloff = 5


-- Packer
vim.cmd [[packadd packer.nvim]]

-- Completions

-- Avoid 'vim' warning
require'lspconfig'.lua_ls.setup {
    -- ... other configs
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- Colorscheme

-- Moonlight
-- Edit

vim.g.moonlight_italic_comments = false
vim.g.moonlight_italic_keywords = false
vim.g.moonlight_italic_functions = false
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = false
vim.g.moonlight_disable_background = false

-- Load
require('moonlight').set()
vim.cmd[[colorscheme moonlight]]
