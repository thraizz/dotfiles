call plug#begin('~/.vim/bundle')
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'ciaranm/detectindent'
Plug 'dense-analysis/ale'
Plug 'posva/vim-vue'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'fadein/vim-FIGlet'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'vimlab/split-term.vim'
Plug 'kassio/neoterm'
Plug 'mileszs/ack.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roman/golden-ratio'
call plug#end()

" Set vim configuration path
" let $VIM_CONFIG=fnamemodify(expand("$MYVIMRC"), ":p:h")
let $VIM_CONFIG='/home/dubai/.config/nvim/'

" Load plugin configuration
so $VIM_CONFIG/plugins.vim
" Load keymaps
so $VIM_CONFIG/keymaps.vim
" Load autocommands
so $VIM_CONFIG/autocommands.vim

set tabstop=4             " number of visual spaces per TAB
set softtabstop=2         " number of spaces in tab when editing
set shiftwidth=2          " number of spaces to use for autoindent
set expandtab             " tabs are space
set autoindent
set copyindent            " copy indent from the previous line
set clipboard+=unnamedplus
set mouse=nv


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
if (strftime("%H") >= 6 && strftime("%H") < 17 && !exists('$DARK')) 
  set background=light
else
  set background=dark
endif
colorscheme gruvbox
syntax enable
set splitbelow
set relativenumber
set laststatus=2
set cursorline
set cmdheight=2
set hidden
set number                " show line number
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set showmatch             " highlight matching brace
set incsearch             " search as characters are entered
set hlsearch              " highlight matche
set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is lower case
set foldenable
set foldlevelstart=10     " default folding level when buffer is opened
set foldnestmax=10        " maximum nested fold
set foldmethod=manual     " fold manual

" Sources
