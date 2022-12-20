vim.keymap.set('n', '<C-b>', require'nvim-tree'.toggle, {silent = true})
vim.keymap.set('n', '<S-A-f>', ":Neoformat<CR>", {silent = true}) 

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<F9>', require'dap'.toggle_breakpoint, {silent = true})
vim.keymap.set('n', '<F5>', require'dap'.continue, {silent = true})
vim.keymap.set('n', '<C-F5>', require("dapui").toggle, {silent = true})
vim.keymap.set('n', '<F10>', require'dap'.step_over, {silent = true})
vim.keymap.set('n', '<F11>', require'dap'.step_into, {silent = true})