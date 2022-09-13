-- Languageserver Manage
require("mason").setup()
local m = require("mason-lspconfig")
m.setup({
  ensure_installed = {
    "sumneko_lua",
    "gopls",
    "bashls",
    "ansiblels",
    "jsonls",
    "powershell_es",
    "pyright",
    "terraformls",
    "yamlls"
  }
})
m.setup_handlers({function(server)

    on_attach = function(client, bufnr)
      vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
      vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
      vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
      vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    end

    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    require('lspconfig')[server].setup({ noremap = true, silent = true })

end})


-- Completion
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
