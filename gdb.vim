" all bindings have , prefix
"
" space - init
"  - suspend program
" k - kill
" W - where
" R - run
" Q - quit
"
" b - break: add
" B - break: clear
" t - break: clear all
"
" n - info: breakpoints
" l - info: locals
" a - info: arguments
"
" q - run: step into
" w - run: step over
" e - run: to finish
" r - run: continue
"
" v - value: direct
" V - value: referenced

" vimgdb stuff
set previewheight=12

if has("gdb")

  map ,<Space> :call gdb("")<CR>
  nmap <silent> ,<C-Z> :call gdb("\032")<CR>

  " set/clear bp at current line
  nmap <silent> ,b :call <SID>Breakpoint("break")<CR>
  nmap <silent> ,B :call <SID>Breakpoint("clear")<CR>
  nmap <silent> ,t :call <SID>Breakpoint("tclear")<CR>
  nmap <silent> ,n :call gdb("info breakpoints")<CR>
  nmap <silent> ,l :call gdb("info locals")<CR>
  nmap <silent> ,a :call gdb("info args")<CR>
  nmap <silent> ,q :call gdb("step")<CR>
  nmap <silent> ,w :call gdb("next")<CR>
  nmap <silent> ,e :call gdb("finish")<CR>
  nmap <silent> ,r :call gdb("continue")<CR>
  nmap <silent> ,k :call gdb("kill")<CR>
  nmap <silent> ,W :call gdb("where")<CR>
  nmap <silent> ,R :call gdb("run")<CR>
  nmap <silent> ,Q :call gdb("quit")<CR>
  " nmap <silent> <C-U> :call gdb("up")<CR>
  " nmap <silent> <C-D> :call gdb("down")<CR>

  " print value at cursor
  nmap <silent> ,v :call gdb("print " . expand("<cword>"))<CR>

  " print value referenced by word at cursor
  nmap <silent> ,V :call gdb("print *" . expand("<cword>"))<CR>

  set asm=0

  " Run cmd on the current line in assembly or symbolic source code
  " parameter cmd may be 'break' or 'clear'
  function! s:Breakpoint(cmd)
      " An asm buffer (a 'nofile')
      if &buftype == "nofile"
    " line start with address 0xhhhh...
    let s = substitute(getline("."), "^\\s*\\(0x\\x\\+\\).*$", "*\\1", "")
    if s != "*"
        call gdb(a:cmd . " " . s)
    endif
      " A source file
      else
    let s = "\"" . fnamemodify(expand("%"), ":p") . ":" . line(".") . "\""
    call gdb(a:cmd . " " . s)
      endif
  endfunction

endif

