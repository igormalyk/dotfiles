set nocompatible    " Not compatible with the old-fashion vi mode

syntax enable    " Enable syntax highlighting
set syntax=on
set number       " Show line numbers
set ruler        " Show bottom line with col, row numbers
set expandtab    " Use spaces instead of tabs
set shiftwidth=4 " 1 tab = 4 spaces
set tabstop=4
set autoindent   " Auto indentation
set smartindent
set wrapscan
set showcmd      " Display incomplete commands
set hlsearch     " Search results highlighting
set incsearch    " Search when typing like in browsers
set smartcase    " ignore case if search pattern is all lowercase, case-sensitive otherwise
set cursorline   " Highlight the current line

set complete=.,b,u,] " autocomplete this file,buffers,tags
set wildmode=list:longest,full
set scrolloff=1 " two lines indentaton from top and bottom

" The next 4 commands set up persistent undo
" WARNING Requires Vim 7.3+
set undodir=~/.vim/undodir
set undofile
set undolevels=1000  " Maximum number of changes that can be undone
set undoreload=10000 " Maximum number lines to save for undo on a buffer reload

" Disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set listchars=tab:>-,trail:.,nbsp:% " show invisible characters
",eol:$
set list

set autowrite " Automatically save any changes made to the buffer

" For convinient use of tabs
" Create a new tab
map tn :tabnew<CR>
" Delete current tab
map tc :tabclose<CR>
" Go to the next tab (left)
map tl :tabnext<CR>
" Go to the previous tab (right)
map th :tabprev<CR>
" Move the tab to the position N (type N)
map tm :tabmove<Space>
" Close all tabs except the current one
map to :tabonly<CR>
" Opens a new tab with the current buffer's path
map te :tabedit <c-r>=expand("%:p:h")<CR>/
" Go to the tab #x
map t1 1gt<CR>
map t2 2gt<CR>
map t3 3gt<CR>
map t4 4gt<CR>
map t5 5gt<CR>
map t6 6gt<CR>
map t7 7gt<CR>
map t8 8gt<CR>
map t9 9gt<CR>
