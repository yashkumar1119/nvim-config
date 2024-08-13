-- Keybindings

-- Leader Key (Space)
vim.g.mapleader= ' '

-- Telescope 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- (Leader + f + f)
vim.keymap.set('n', '<leader>gf', builtin.git_files, {}) -- (Leader + g + f)
vim.keymap.set('n', '<C-f>', builtin.live_grep, {}) -- (Ctrl + f)

-- Scrolling 
vim.keymap.set('n', '<leader>j', '20j', {}) -- (Leader + j)
vim.keymap.set('n', '<leader>k', '20k', {}) -- (Leader + k)

-- Saving
vim.keymap.set('n', '<C-s>', vim.cmd.w) -- (Ctrl + s)
vim.keymap.set('n', '<C-S-s>', vim.cmd.wa) -- (Ctrl + Shift + s)
vim.keymap.set('n', '<C-q>', vim.cmd.q) -- (Ctrl + q)

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file) -- (Leader + a)
vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu) -- (Leader + m)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end) -- (Leader + 1)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end) -- (Leader + 2)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end) -- (Leader + 3)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end) -- (Leader + 4)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end) -- (Leader + 5)


-- Completions
vim.keymap.set('i', '<C-Space>', function() require('cmp').complete() end, { noremap = true, silent = true }) -- (Space)
vim.keymap.set('i', '<CR>', function() -- (Enter)
    local cmp = require('cmp')
    if cmp.visible() then
        cmp.confirm({ select = true })
    else
        -- Use vim.fn to insert a newline if the completion menu is not visible
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n')
    end
end, { noremap = true, silent = true })
vim.keymap.set('i', '<C-e>', function() require('cmp').abort() end, { noremap = true, silent = true }) -- (Ctrl + e)
vim.keymap.set('i', '<C-j>', function() require('cmp').scroll(4) end, { noremap = true, silent = true }) -- (Ctrl + j)
vim.keymap.set('i', '<C-k>', function() require('cmp').scroll(-4) end, { noremap = true, silent = true } -- (Ctrl + k)
)
-- File Tree
vim.keymap.set('n', '<leader>`', ':NvimTreeToggle<CR>', { noremap = true }) -- (Leader + `)

-- Toggle Term 
vim.keymap.set('n', '<leader>t', function() require("toggleterm").toggle() end, { noremap = true, silent = true }) -- (Leader + t)

