"activate pathogen
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'javacomplete'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'sontek/rope-vim'
Bundle 'tomtom/tcomment_vim.git'

Bundle 'Valodim/vim-swap'
Bundle 'majutsushi/tagbar'

Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-smooth-scroll'
Bundle 'AndrewRadev/switch.vim.git'
Bundle 'nathanaelkane/vim-indent-guides'

let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
endif

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set foldmethod=expr   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set foldlevel=1

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

" powerline is largely unconfigured
set laststatus=2
let g:Powerline_symbols = 'fancy'

" easymotion leader is <tab>
let g:EasyMotion_leader_key = '<Tab>'

" close preview window after completion
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_invoke_completion = 'jk'

" only one column of indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_indent_levels = 5
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"tell the term has 256 colors
set t_Co=256

"hide buffers when not displayed
set hidden

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"define :HighlightLongLines command to highlight the offending parts of
"lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 79
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth) . 'v/'
    else
        echomsg "Usage: HighlightLongLines [natural number]"
    endif
endfunction

let g:load_doxygen_syntax=1

" for diffing
set diffopt+=iwhite

" fuzzyfinder: igore bunch of stuff
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif"

runtime! config/*.vim
