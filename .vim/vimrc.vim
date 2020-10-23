let g:ale_disable_lsp = 1
call plug#begin('~/.vim/bundle')
Plug 'thraizz/vim-notes'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'ciaranm/detectindent'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'fadein/vim-FIGlet'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'vimlab/split-term.vim'
Plug 'mileszs/ack.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


""" Behaviour on Events: Autocommands
autocmd StdinReadPre * let s:std_in=1
" Show NERDTree when opening a directory with vim
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Resize the window automatically
autocmd VimResized * wincmd =

""" Making VIM look nice: Visual Settings
syntax on
set shortmess+=c
set splitbelow
set relativenumber
set conceallevel=1
set laststatus=2
set cursorline
set cmdheight=2
set t_Co=256
if (strftime("%H") >= 6 && strftime("%H") < 18 && !exists('$DARK')) 
  colorscheme onehalflight
else
  colorscheme onehalfdark
endif

" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
" endif

""" Plugin Configurations
" ALE Vim settings, a syntanx linter
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'javascript': ['eslint'], 'vue': ['eslint'], 'python': ['flake8']}
let g:ale_fixers = {'javascript': ['eslint'], 'vue': ['eslint'], 'python': ['autopep8']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
" CtrlP Settings
let g:ctrlp_user_command = 'fd --type f --hidden --follow --exclude .git'
" Emmet Settings
let g:user_emmet_leader_key=','
let g:indentLine_conceallevel=1
let g:indentLine_char='·'
let g:indentLine_enabled=1
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }


""" Keymaps
" Escape with jj
imap jj <ESC>:noh<CR>
" Show current files in Buffer with Ctrl+f
map <C-f> :CtrlPBuffer<CR>
" Show NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>
" In insert or command mode, move normally by using Ctrl
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <S-Tab> <C-d>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
nnoremap <C-s> :Ack!<Space>
" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <S-Tab> <<
noremap <F9> :!%:p<ENTER>
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>/ so we're ready to type the search keyword

