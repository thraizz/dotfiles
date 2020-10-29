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
call plug#end()

 
" Load plugin configuration
so ~/.config/nvim/plugins.vim
" Load keymaps
so ~/.config/nvim/keymaps.vim
" Load autocommands
so ~/.config/nvim/autocommands.vim

set tabstop=4             " number of visual spaces per TAB
set softtabstop=2         " number of spaces in tab when editing
set shiftwidth=2          " number of spaces to use for autoindent
set expandtab             " tabs are space
set autoindent
set copyindent            " copy indent from the previous line
set clipboard+=unnamedplus


if (strftime("%H") >= 6 && strftime("%H") < 17 && !exists('$DARK')) 
  colorscheme onehalflight
  set background light
else
  colorscheme gruvbox
endif
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
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
