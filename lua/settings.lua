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

-- Hide the ~ characters in empty lines
vim.cmd([[set fillchars+=eob:\ ]])  -- Set 'eob' fillchars to a space

-- Autosave
local function auto_save()
  if vim.fn.mode() == 'n' then  -- Check if in Normal mode
    vim.cmd('silent! write')  -- Save the file
  end
end

-- Set up a timer that runs the auto_save function every 1 second
vim.fn.timer_start(100, auto_save, {["repeat"] = -1})

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
vim.cmd('colorscheme everforest')
vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight NonText guibg=NONE ctermbg=NONE]]
