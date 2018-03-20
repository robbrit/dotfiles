set nocompatible  " We don't want vi compatibility.

filetype on
filetype indent on
filetype plugin on
syntax enable

set encoding=utf-8
set viminfo^=!
set number
set smarttab
set ai
set guifont=Inconsolata\ for\ Powerline\ 18
set nowrap
set bs=2
set incsearch
set vb t_vb=
set et
set ts=2
set sw=2
set sts=2
set wildmode=longest,list,full
set wildmenu
set go-=m
set go-=T
set showtabline=2
set laststatus=2
set nofoldenable
set synmaxcol=240

if has("gui_running")
  set lines=53 columns=150
  colorscheme tir_black
else
  colorscheme pablo
endif

" show 80 character limit
set colorcolumn=80
highlight colorcolumn guibg=#151515

" Some key bindings
let mapleader=","
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

" Command-T stuff
map <Leader>f :CommandTFlush<CR>
let g:CommandTWildIgnore=&wildignore . ",*.swp,*.png,*.jpg,*.ico,*.bson,*.swo,*.pyc,.git/*"
let g:CommandTFileScanner = "git"
let g:CommandTTraverseSCM = "pwd"
let g:CommandTNeverShowDotFiles = 1

" All my stupid spelling mistakes
iab optoins options
iab functoin function
iab locatoin location
iab lcoation location
iab lcoatoin location
iab itneger integer

let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:airline_powerline_fonts = 1

let g:go_def_mapping_enabled = 0

set completeopt-=preview

" load vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'
" Show indent levels
Plugin 'Yggdroot/indentLine'
" Use indent levels as text objects
Plugin 'michaeljsmith/vim-indent-object'
" Powerline
Plugin 'bling/vim-airline'
" Fuzzy finder
Plugin 'wincent/Command-T'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Macro repository
Plugin 'marvim'
" Autocompletion
Plugin 'Valloric/YouCompleteMe'
" vim-go
Plugin 'fatih/vim-go'

call vundle#end()

source /usr/share/vim/google/google.vim
filetype plugin indent on
syntax on

autocmd BufReadPost *.go set ts=2
autocmd BufWritePost *.go :GoImports
autocmd BufWritePost *.go set ts=2

noremap <C-T> <Esc>:tabnew 
noremap <C-Tab> <Esc>gt
noremap <C-S-Tab> <Esc>gT
