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
map <C-T> <Esc>:tabnew 
map <C-Tab> <Esc>gt
map <C-S-Tab> <Esc>gT
let mapleader=","

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

" disable folding since it is annoying
set nofoldenable

" Map Ctrl+F to fuzzy finder in new tab
" Map Ctrl+Shift+F to fuzzy finder in current tab
map <C-F> <Esc>:tabnew<CR>:FufCoverageFile<CR>
map <C-S-F> <Esc>:FufCoverageFile<CR>
map <Leader>f :FufRenewCache<CR>

" Fuzzy Finder excludes - exclude zend, node modules, virtualenv stuff
let g:fuf_coveragefile_exclude='\vnode_modules|library|\vlog\v|\vlib|bin|local|include[^s]|*.(swp|png|jpg|ico|swo|bson)$'
let g:fuf_coveragefile_prompt = "Find> "
highlight Pmenu guibg=#333      " Choose colour that doesn't make eyes bleed

" Python plugin settings
let g:pymode_lint_mccabe_complexity = 100
let g:pep8_ignore="E501,E126,E127"

" All my stupid spelling mistakes
iab optoins options
iab functoin function
iab locatoin location
iab lcoation location
iab lcoatoin location
iab itneger integer

" PHP stuff
function! OpenPHPManual(keyword)
  let firefox = '/Applications/Firefox.app/Contents/MacOS/firefox-bin'
  let url = 'http://www.php.net/' . a:keyword
  exec '! firefox "' . url . '"'
endfunction
autocmd FileType php noremap K :call OpenPHPManual(expand('<cword>'))<CR>
autocmd FileType php noremap <Leader>c :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap K :call OpenPHPManual(expand('<cword>'))<CR>
autocmd FileType phtml noremap <Leader>c :!/usr/bin/env php -l %<CR>
 
" load pathogen
call pathogen#infect()

" Bundles I like:
" - indentLine
" - ScrollColors
" - vim-indent-object
" - Powerline
"
" Language-specific Bundles:
" - vim-coffee-script
" - jslint
" - mustache
" - python-mode
