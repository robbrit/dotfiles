filetype on

set encoding=utf-8    " Fuck unicode

set number
set smarttab
set ai
set guifont=Inconsolata\ 13
set nowrap
set bs=2
set incsearch

" 2 spaces, no tabs
set et
set ts=2
set sw=2

if has("gui_running")
  set lines=53 columns=150
endif

" Some GUI options
set go-=m
set go-=T
set showtabline=2  " Always show tab bar
set laststatus=2

" Improve performance for long lines
set synmaxcol=240

" disable error bells
set vb t_vb=

" show 80 character limit
set colorcolumn=80
highlight colorcolumn guibg=#151515

filetype indent on
filetype plugin on

syntax enable
colorscheme tir_black

set nocompatible  " We don't want vi compatibility.
 
set viminfo^=!

" Some key bindings
let mapleader=","
noremap <C-T> <Esc>:tabnew 
noremap <C-Tab> <Esc>gt
noremap <C-S-Tab> <Esc>gT
" disable Ex mode
noremap Q <Esc>

noremap <Leader>x <Esc>:x<CR>
noremap <Leader>w <Esc>:w<CR>
noremap <Leader>q <Esc>:q<CR>

" Map F1 to Esc since I keep hitting it when I try to hit escape
map <F1> <Esc>
imap <F1> <Esc>

" Map ' to " so that I don't have to use Shift to switch registers
map ' "

" Some random file associations
au BufNewFile,BufRead *.m set ft=matlab
au BufNewFile,BufRead *.pde set ft=c
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.mustache set ft=mustache
au BufNewFile,BufRead *.phtml set ft=php

" Map Ctrl+F to fuzzy finder in new tab
" Map Ctrl+Shift+F to fuzzy finder in current tab
map <C-F> <Esc>:tabnew<CR>:FufCoverageFile<CR>
map <C-S-F> <Esc>:FufCoverageFile<CR>
map <Leader>f :FufRenewCache<CR>

" Fuzzy Finder excludes - exclude zend, node modules, virtualenv stuff
let g:fuf_coveragefile_exclude='\vnode_modules|library|\vlog\v|\vlib|bin|local|dump|include[^s]|*.(swp|png|jpg|ico|swo|bson)$'
let g:fuf_coveragefile_prompt = "Find> "
highlight Pmenu guibg=#333      " Choose colour that doesn't make eyes bleed

" All my stupid spelling mistakes
iab optoins options
iab functoin function
iab locatoin location
iab lcoation location
iab lcoatoin location
iab itneger integer

" PHP stuff
function! OpenPHPManual(keyword)
  let url = 'http://www.php.net/' . a:keyword
  exec '! firefox "' . url . '"'
endfunction
autocmd FileType php noremap K :call OpenPHPManual(expand('<cword>'))<CR>
autocmd FileType php noremap <Leader>c :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap K :call OpenPHPManual(expand('<cword>'))<CR>
autocmd FileType phtml noremap <Leader>c :!/usr/bin/env php -l %<CR>

" Python plugin settings
let g:pymode_lint_mccabe_complexity = 100
let g:pymode_lint_ignore="E501,E126,E127"
let g:pep8_ignore="E501,E126,E127"
let g:syntastic_python_checker="flake8"
let g:syntastic_python_checker_args="--ignore=E501,E126,E127"

let g:syntastic_cpp_compiler_options = ' -std=c++11'
 
" load vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Some bundles
Bundle "Yggdroot/indentLine"
Bundle "ScrollColors"
Bundle "michaeljsmith/vim-indent-object"
Bundle "Lokaltog/powerline"
Bundle "FuzzyFinder"
Bundle "scrooloose/syntastic"
Bundle "marvim"

" Language-specific Bundles:
Bundle "kchmck/vim-coffee-script"
Bundle "hallettj/jslint.vim"
Bundle "juvenn/mustache.vim"
Bundle "klen/python-mode"
Bundle "groenewege/vim-less"
Bundle "jnwhiteh/vim-golang"
Bundle "plasticboy/vim-markdown"
Bundle "digitaltoad/vim-jade"
Bundle "tclem/vim-arduino"
Bundle "leafgarland/typescript-vim"

filetype plugin indent on

" disable folding since it is annoying
set nofoldenable
