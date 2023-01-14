local null_ls = require("null-ls")
null_ls.setup({
  source = {
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
  },
})
