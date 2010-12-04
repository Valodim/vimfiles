"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
set number

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set ruler

" search stuff
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set smartcase   " ignore case for lowercase-only searches

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points

"indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" switch buffers properly
set switchbuf=usetab,newtab

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set updatetime=500

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:¬

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"some stuff to get the mouse going in term
" set mouse=a
" set ttymouse=xterm2

"tell the term has 256 colors
set t_Co=256

"hide buffers when not displayed
set hidden

" focus it
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Close_On_Select = 0

