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

echo "欢迎回来！主人。本 Neo Vim 具有超级牛力。"