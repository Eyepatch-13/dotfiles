local yazi = require('yazi')

yazi.setup()

vim.keymap.set("n", "<leader>-", function() yazi.yazi() end)
vim.keymap.set("n", "<leader>cw", function() yazi.yazi(nil, vim.fn.getcwd()) end)
