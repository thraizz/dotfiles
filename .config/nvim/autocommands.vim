"              _                                                      _      
"   __ _ _   _| |_ ___   ___ ___  _ __ ___  _ __ ___   __ _ _ __   __| |___  
"  / _` | | | | __/ _ \ / __/ _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` / __| 
" | (_| | |_| | || (_) | (_| (_) | | | | | | | | | | | (_| | | | | (_| \__ \ 
"  \__,_|\__,_|\__\___/ \___\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|___/ 
"                                                                            
" 
" Show NERDTree when opening a directory with vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd BufNewFile *.test.js silent! read $VIM_CONFIG/templates/jest-template
