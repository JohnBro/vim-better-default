scriptencoding utf-8

function! default#smart_quit()
  echom "fuck!"
  if &readonly
    execute 'quit'
  else
    execute 'wq'
  endif
endfunction
