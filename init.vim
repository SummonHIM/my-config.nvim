lua require('init')

set nu
colorscheme material
set completeopt=menu,menuone,noselect
set list

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

map <C-b> :NvimTreeToggle<CR>
map <C-s> :w<CR>

imap <C-b> <Esc>:NvimTreeToggle<CR>i
imap <C-s> <Esc>:w<CR>i
imap <C-z> <Esc>:undo<CR>i
imap <C-y> <Esc>:redo<CR>i