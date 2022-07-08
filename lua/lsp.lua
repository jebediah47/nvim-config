require("nvim-lsp-installer").setup {
  automatic_installation = true
}

local lspconfig = require("lspconfig")

-- C/C++ Language servers
lspconfig.clangd.setup {}

-- Go LSP server
lspconfig.gopls.setup {}

-- Webdev config
-- JavaScript/TypeScript LSP server
lspconfig.tsserver.setup {
    filetypes = { "typescript", "javascript" }
}

-- Astro LSP server
lspconfig.astro.setup {
    filetypes = { "astro" }
}

-- TailwindCSS LSP server
lspconfig.tailwindcss.setup {}

-- Svelte LSP server
lspconfig.svelte.setup {
    filetypes = { "svelte" }
}

-- ESLint config
lspconfig.eslint.setup {}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

