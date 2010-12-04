" quickfix window toggle
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction
nnoremap zq :QFix<CR>

nnoremap zm zmzz
nnoremap zr zrzz

" nnoremap <PageUp> :tabprev<CR>
" nnoremap <PageDown> :tabnext<CR>

" Insert newline
nnoremap <S-Enter> O<ESC>
nnoremap <Enter> o<ESC>

" bind utl for opening urls
nmap ,m :Utl
" escape from insert mode
inoremap jj 
inoremap hh 
inoremap ;; ;
nnoremap <space> :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap \' :YRShow<CR>
nnoremap K :TlistOpen<CR>
nnoremap <C-K> :BufExplorer<CR>
nnoremap <silent> zs :w<CR>
nnoremap <silent> \a :A<CR>
nnoremap ,. :FuzzyFinderTextMate<CR>

" comment stuff
nnoremap <silent> ,/ :call NERDComment(0, "norm")<cr>
vnoremap <silent> ,/ <ESC>:call NERDComment(1, "norm")<cr>
nnoremap <silent> ,? :call NERDComment(0, "uncomment")<cr>
vnoremap <silent> ,? <ESC>:call NERDComment(1, "uncomment")<cr>

nnoremap <silent> \| "_

nnoremap <silent> , :call NERDComment(0, "sexy")<CR>
vnoremap <silent> , <ESC>:call NERDComment(1, "sexy")<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
nnoremap \<space> :nohls<CR>
inoremap <C-L> <C-O>:nohls<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" for paste mode
set pastetoggle=<F11>

" sudo write
command W w !sudo tee % > /dev/null
