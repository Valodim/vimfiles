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

map ,<Space> :C 
nmap <silent> ,<C-Z> :C interrupt<CR>

" set/clear bp at current line
nmap <silent> ,b :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>
nmap <silent> ,B :exe "Cclear " . expand("%:p") . ":" . line(".")<CR>
nmap <silent> ,t :C clear<CR>
nmap <silent> ,n :C info breakpoints<CR>
nmap <silent> ,l :C info locals<CR>
nmap <silent> ,a :C info args<CR>
nmap <silent> ,q :C step<CR>
nmap <silent> ,w :C next<CR>
nmap <silent> ,e :C finish<CR>
nmap <silent> ,r :C continue<CR>
nmap <silent> ,k :C kill<CR>
nmap <silent> ,W :C where<CR>
nmap <silent> ,R :C run<CR>
nmap <silent> ,Q :C quit<CR>

" print value at cursor
nmap <silent> ,v :exe "C print " . expand("<cword>")<CR>
" print value referenced by word at cursor
nmap <silent> ,V :exe "C print *" . expand("<cword>")<CR>
