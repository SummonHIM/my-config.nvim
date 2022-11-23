require('keymaps')
require('plugins')
require('lsp/nvim-cmp')
require('lsp/nvim-lspconfig')
require('lsp/nvim-lsp-format')
require('theme/material')
require('tools/nvim-barbar')
require('tools/nvim-lualine')
require("tools/nvim-telescope")
require('tools/nvim-tree')
require("tools/nvim-formatter")

vim.cmd([[
    set number
    colorscheme material
    set completeopt=menu,menuone,noselect
    set list
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set autoindent
    set smartindent
    set nowrap
]])
