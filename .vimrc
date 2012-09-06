set nocompatible    " Not compatible with the old-fashion vi mode

" Initializing pathogen for plugin loading
" https://github.com/tpope/vim-pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" http://superuser.com/questions/399296/256-color-support-for-vim-background-in-tmux
set t_Co=256        " Setting 256 color mode for nice color theme support
syntax enable       " Enable syntax highlighting
set background=dark " Use dark colorscheme if available

let g:solarized_termcolors=256
let g:solarized_visibility='high'
" colorscheme solarized
let g:molokai_original = 0
colorscheme molokai

set number " Show line numbers
set ruler  " Show bottom line with col, row numbers

set syntax=on
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
set showmatch    " Show matching brackets when cursor is ovre them

set complete=.,b,u,] " autocomplete this file,buffers,tags
set wildmode=list:longest,full
set scrolloff=2 " two lines indentaton from top and bottom

" ctags currently don't work. @todo fix this
" set tags=tags,/home/igorm/.vim/tags/tags
" set tags=./tags,tags,~/.vim/tags/tags
" set tags=~/.vim/tags/tags
set tags=~/.vim/tags/2.9.x_and_zf1
" set tags=tags,/home/igorm/Dropbox/linux/config/vim/ctags/tags

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
runtime! plugin/*.vim

" Taken from mwop's blog
" Run file with PHP CLI (CTRL-M)
" http://mwop.net/blog/164-Vim-Productivity-Tips-for-PHP-Developers.html
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

:set tags=~/.vim/mytags/framework

" List all the bufers including hidden and move to the chosen one
:nnoremap <F5> :buffers!<CR>:buffer<Space>
set hidden    " Lets you abandon the buffer even if it wasn't saved
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

" Switching between buffers behavior
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Status line
" https://github.com/vgod/vimrc/blob/master/vimrc
" set laststatus=2
" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
" set statusline+=\ \ \ [%{&ff}/%Y]
" set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

" function! CurDir()
"     let curdir = substitute(getcwd(), $HOME, "~", "")
"     return curdir
" endfunction
" 
" function! HasPaste()
"     if &paste
"         return '[PASTE]'
"     else
"         return ''
"     endif
" endfunction

"When you type an open brace, this will automatically
"insert a closing brace on the same line, after the cursor.
"If you quickly hit Enter after the open brace, (to begin
"a code block), the closing brace will be inserted on the
"line below the cursor. If you quickly press the open brace
"key again after the open brace, Vim won't insert anything extra,
" you'll just get a single open brace. Finally, if you quickly
"type an open and close brace, Vim will not do anything special.
"http://rishabhsays.wordpress.com/2010/07/03/vim-for-lazy-people/
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}
" 
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()
" 
" inoremap [      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O
" inoremap [[     [
" inoremap []     []

" Notes:
" ctags plugin shortcuts
" C-] - go to definition
" C-T - Jump back from the definition.
" C-W C-] - Open the definition in a horizontal split 


" Good examples of .vimrc configuration:
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
