scriptencoding utf-8

function! default#smart_quit()
  if &modified
    execute 'wq'
  else
    execute 'quit'
  endif
endfunction
