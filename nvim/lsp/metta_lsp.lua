vim.lsp.config.metta_lsp = {
  cmd = { 'node', vim.fn.expand('~/.local/src/metta-lsp/server/dist/server.js'), '--stdio' },
  filetypes = { 'metta' },
  root_markers = { '.git' },
  settings = {
    metta = {
      diagnostics = {
        undefinedFunctions = true,
        undefinedVariables = true,
        undefinedBindings = true,
      },
    },
  },
}
