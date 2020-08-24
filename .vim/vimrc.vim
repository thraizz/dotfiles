set nocompatible              " be iMproved, required
set noshowmode
set shell=/bin/bash
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'thraizz/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'dylanaraps/wal.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'dense-analysis/ale'
Plugin 'posva/vim-vue'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'fadein/vim-FIGlet'

call vundle#end()            " required
filetype plugin indent on    " required

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimResized * wincmd =

" ALE Vim settings
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_linters = {'vue': ['eslint']}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fix_on_save = 1


" Visual Settings
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_char='|'
let g:indentLine_enabled=1

highlight link notesDoneItem Conceal
highlight link notesInlineCode Special

map <C-n> :NERDTreeFocus<CR>
set tabstop=4
set shiftwidth=4
set expandtab
set number
set nowrap
set clipboard+=unnamedplus
set laststatus=2


syntax on
colorscheme wal

" Settings for vim notes
highlight link notesDoneItem Conceal
highlight link notesInlineCode Special

""" Keymaps
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
" Map FZF to Ctrl+P
nnoremap <C-p> :<C-u>FZF %:p:h<CR> 
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

noremap <F9> :! clear; %:p<ENTER>
