local setkey = vim.keymap.set

vim.g.magma_automatically_open_output = false


setkey('n', '<leader>rl', ':MagmaEvaluateLine<CR>', {silent=true})
setkey('v','<leader>re', ':<C-u>MagmaEvaluateVisual<CR>', {silent=true})
setkey('n','<leader>rd', ':MagmaDelete<CR>', {silent=true})
setkey('n','<leader>ro', ':MagmaShowOutput<CR>', {silent=true})

