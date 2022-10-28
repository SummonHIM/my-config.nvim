lua require('init')
lua require('plugins')
lua require('lsp/nvim-cmp')
lua require('lsp/nvim-lspconfig')
lua require('theme/material')
lua require('tools/nvim-lualine')
lua require('tools/nvim-tree')

set nu
colorscheme material
set completeopt=menu,menuone,noselect

nmap <C-b> :NvimTreeToggle<CR>