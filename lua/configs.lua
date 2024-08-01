local lspconfig = require('lspconfig')
local cmp = require('cmp')
local lspkind = require('lspkind')

-- Setup nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-l>'] = cmp.mapping.select_next_item(), -- Add this line for next item
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Add this line for previous item
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    }
})


-- Function to setup LSP servers
local function setup_servers()
    local servers = { 'clangd', 'pyright', 'gopls', 'tsserver', 'jdtls', 'omnisharp' }

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        }
    end
end

setup_servers()


