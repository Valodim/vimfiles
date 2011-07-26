" http://vim.wikia.com/wiki/Go_away_and_come_back
" Creates a session  
function! MakeSession() 
 
 let b:sessiondir = $HOME . "/.vim/sessions" . getcwd() 
 if (filewritable(b:sessiondir) != 2) 
   exe 'silent !mkdir -p ' b:sessiondir 
   redraw! 
 endif 
 let b:sessionfile = b:sessiondir . '/session.vim' 
 exe "mksession! " . b:sessionfile 
 
endfunction 
 
" Updates a session, BUT ONLY IF IT ALREADY EXISTS 
function! UpdateSession() 
 
 let b:sessiondir = $HOME . "/.vim/sessions" . getcwd() 
 let b:sessionfile = b:sessiondir . "/session.vim" 
 if (filereadable(b:sessionfile)) 
   exe "mksession! " . b:sessionfile 
   echo "updating session" 
 endif 
 
endfunction 
 
" Loads a session if it exists 
function! LoadSession() 
 if argc() == 0 
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd() 
  let b:sessionfile = b:sessiondir . "/session.vim" 
  if (filereadable(b:sessionfile)) 
    exe 'source ' b:sessionfile 
  else 
    echo "No session loaded." 
  endif 
 else 
  let b:sessionfile = "" 
  let b:sessiondir = "" 
 endif 
endfunction 

au VimEnter * :call LoadSession()
au VimLeave * :call UpdateSession()
