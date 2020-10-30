" Escape with jj
imap jj <ESC>:noh<CR>
" Show current files in Buffer with Ctrl+f
map <C-f> :CtrlPBuffer<CR>
" Show NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

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

" Bind Ack to Ctrl+S
nnoremap <C-s> :Ack!<Space>
" Navigate ALE quickfix list with ease
nnoremap <silent> [q :ALEPrevious<CR>
nnoremap <silent> ]q :ALENext<CR>
nnoremap <S-Tab> <<
noremap <F9> :!%:p<ENTER>
" Don't jump to first match
cnoreabbrev Ack Ack!
