local group = vim.api.nvim_create_augroup("TypeScriptImportActions", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx" },
  group = group,
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports.ts" } }, apply = true })
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports.ts" } }, apply = true })
  end,
})
