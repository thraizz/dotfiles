set nocompatible              " be iMproved, required
set shell=/bin/bash
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" My own plugins

Plugin 'thraizz/vim-notes'
Plugin 'xolox/vim-misc'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'dylanaraps/wal.vim'
Plugin 'Yggdroot/indentLine'


call vundle#end()            " required
filetype plugin indent on    " required

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


set conceallevel=1

let g:indentLine_conceallevel=1
let g:indentLine_char='|'
let g:indentLine_enabled=1

map <C-n> :NERDTreeFocus<CR>

noremap <F9> :! clear; %:p<ENTER>
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" View line numbers
set number

colorscheme wal
syntax on

" Settings for vim notes
highlight link notesDoneItem Conceal
highlight link notesInlineCode Special
"set hi VertSplit ctermfg=2
