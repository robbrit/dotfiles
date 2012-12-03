filetype on

set ts=2
set number
set sw=2
set smarttab
set ai
set guifont=Inconsolata\ 13
set nowrap
set bs=2
set et
set incsearch
if has("gui_running")
  set lines=50 columns=150
endif

" Some GUI options
set go-=mT
set showtabline=2  " Always show tab bar

" disable error bells
set noeb vb t_vb=
set novb

" show 80 character limit
set colorcolumn=80
highlight colorcolumn guibg=#151515

filetype indent on
filetype plugin on

syntax enable
colorscheme railscasts

set nocompatible  " We don't want vi compatibility.
 
set viminfo^=!

" Some key bindings
map <C-T> <Esc>:tabnew 
map <C-Tab> <Esc>gt
map <C-S-Tab> <Esc>gT

" .m files are for Matlab/Octave
au BufNewFile,BufRead *.m set ft=matlab
" .pde is Arduino
au BufNewFile,BufRead *.pde set ft=c
" .ejs are JST
au BufNewFile,BufRead *.ejs set ft=html
