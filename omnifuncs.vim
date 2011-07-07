autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" omnicompletion
set tags=./tags,../tags,./build/tags
set tags+=~/.vim/tags/stdlib,~/.vim/tags/gl.tags

" OmniCppComplete
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set completeopt=menuone,menu,longest,preview

let g:clang_use_library = 1
let g:clang_library_path = "/opt/lunar/llvm/lib/"
let g:clang_user_options = "-I /usr/include/c++/4.5.2/ -I /usr/include/c++/4.5.2/i686-pc-linux-gnu"
let g:clang_complete_auto = 0
