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
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'dylanaraps/wal.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'ciaranm/detectindent'
Plugin 'dense-analysis/ale'
Plugin 'posva/vim-vue'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vimlab/split-term.vim'

call vundle#end()            " required
filetype plugin indent on    " required


""" Behaviour on Events: Autocommands
autocmd StdinReadPre * let s:std_in=1
" Show NERDTree when opening a directory with vim
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Resize the window automatically
autocmd VimResized * wincmd =

""" Making VIM look nice: Visual Settings
set splitbelow
set relativenumber
set conceallevel=1
set laststatus=2
highlight link notesDoneItem Conceal
highlight link notesInlineCode Special
" Settings for vim notes
highlight link notesDoneItem Conceal
highlight link notesInlineCode Special
colorscheme onehalflight
syntax on

""" Plugin Configurations
" ALE Vim settings, a syntanx linter
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'javascript': ['eslint'], 'vue': ['eslint'], 'python': ['flake8', 'pylint']}
let g:ale_fixers = {'javascript': ['eslint'], 'vue': ['eslint'], 'python': ['autopep8', 'yapf']}
let g:ale_fix_on_save = 1
" CtrlP Settings
let g:ctrlp_user_command = 'fd --type f --hidden --follow --exclude .git'
" Emmet Settings
let g:user_emmet_leader_key=','
let g:indentLine_conceallevel=1
let g:indentLine_char='|'
let g:indentLine_enabled=1

""" Keymaps
" Escape with jj
imap jj <ESC>:noh<CR>
" Show current files in Buffer with Ctrl+f
map <C-f> :CtrlPBuffer<CR>
" Show NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <S-Tab> <C-d>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
nnoremap <S-Tab> <<
noremap <F9> :!%:p<ENTER>
