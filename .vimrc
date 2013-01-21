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
set vb t_vb=

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

" Unbind K since it is annoying
map K k

" Map F1 to Esc since I keep hitting it when I try to hit escape
map <F1> <Esc>
imap <F1> <Esc>

" Map ' to " so that I don't have to use Shift to switch registers
map ' "

" .m files are for Matlab/Octave
au BufNewFile,BufRead *.m set ft=matlab
" .pde is Arduino
au BufNewFile,BufRead *.pde set ft=c
" .json is Javascript
au BufNewFile,BufRead *.json set ft=javascript
" .mustache is Mustache
au BufNewFile,BufRead *.mustache set ft=mustache

" disable folding since it is annoying
set nofoldenable
 
" load pathogen
call pathogen#infect()

" Map Ctrl+F to fuzzy finder
map <C-F> <Esc>:tabnew<CR>:FufCoverageFile<CR>

" Fuzzy Finder excludes - exclude zend and node modules
let g:fuf_coveragefile_exclude='\vnode_modules|library|log'
let g:fuf_coveragefile_prompt = "Find> "
