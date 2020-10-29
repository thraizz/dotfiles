""        _             _            
""  _ __ | |_   _  __ _(_)_ __  ___  
"" | '_ \| | | | |/ _` | | '_ \/ __| 
"" | |_) | | |_| | (_| | | | | \__ \ 
"" | .__/|_|\__,_|\__, |_|_| |_|___/ 
"" |_|            |___/              
""
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
" ACK! Settings
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1
" Vim-Notes Settings
let g:notes_directories = ['~/Documents/Notes']

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
