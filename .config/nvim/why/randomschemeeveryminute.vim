function! RandomNumber(limit) 
  let components = split(reltimestr(reltime()), '\.')
  let microseconds = components[-1] + 0
  return microseconds % a:limit
endfunction

function! RandomScheme() 
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n") 
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

let g:total=1
function! SwitchScheme()
  call feedkeys("f\e")
  if(g:total % 15 == 0)
    " update time is usually set to 4 seconds
    " So the scheme would be changed on 1 minute of inactivity
    call RandomScheme()
  endif
  let g:total = g:total + 1
endfunction

:command NewColor call RandomScheme()
