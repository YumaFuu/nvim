require('fzf-lua').setup({
  winopts = {
    height     = 0.85,
    width      = 0.80,
    row        = 0.35,
    col        = 0.50,
    border     = 'rounded',
  }
})

vim.keymap.set('n', '<leader>\'', "<cmd>lua require('fzf-lua').files()<CR>")
vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').git_status()<CR>")
vim.keymap.set('n', '<leader>l', "<cmd>lua require('fzf-lua').blines()<CR>")
vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>")
vim.keymap.set('n', '<leader>a', "<cmd>lua require('fzf-lua').live_grep_glob()<CR>")

vim.keymap.set('n', '<leader>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>")
vim.keymap.set('n', '<leader>d', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>")
vim.keymap.set('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>")
vim.keymap.set('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>")
vim.keymap.set('n', '<leader>y', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
vim.keymap.set('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>")
