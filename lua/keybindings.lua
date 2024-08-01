-- Keybindings

-- Leader Key (Space)
vim.g.mapleader = ' '

-- Return to Net RW (Leader + p + v)
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Scroll Down/Up Respectively 20 Lines
vim.keymap.set('n', '<leader>j', '20j', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '20k', { noremap = true, silent = true })

-- -- -- -- -- -- --
--    Telescope   -- 
-- -- -- -- -- -- --

-- Find Local Files (Leader + f + f)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })

-- Find Git Files (Leader + g + f) 
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>', { noremap = true, silent = true })

-- Search Word
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

-- -- -- -- -- --
--   Harpoon   --
-- -- -- -- -- --

-- Add Current File to Menu (Leader + a)
vim.keymap.set('n', '<leader>a', function() require("harpoon.mark").add_file() end, { noremap = true, silent = true })

-- Toggle Quick Menu (Leader + m)
vim.keymap.set('n', '<leader>m', function() require("harpoon.ui").toggle_quick_menu() end, { noremap = true, silent = true })

-- Navigating to Files (Leader + 1 to 5)
vim.keymap.set('n', '<leader>1', function() require("harpoon.ui").nav_file(1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', function() require("harpoon.ui").nav_file(2) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', function() require("harpoon.ui").nav_file(3) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', function() require("harpoon.ui").nav_file(4) end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', function() require("harpoon.ui").nav_file(5) end, { noremap = true, silent = true })
