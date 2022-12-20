require('keymaps')
require('plugins')
require('lsp/nvim-cmp')
require('lsp/nvim-lspconfig')
vim.g.material_style = "darker"
require'bufferline'.setup {
    animation = false
}
require('lualine').setup {
    options = {
        theme = 'moonfly'
    }
}
require('tools/nvim-tree')
require("dapui").setup()
require("tools/nvim-dap")

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
