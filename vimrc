" An example for a vimrc file.  
" Stolen from: Bram Moolenaar <Bram@vim.org>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

""""""""""""""""""""""""""""""""""""""""""""""""""""""

"see :h 'option' for more info on any of these
set confirm "ask to save instead of failing with an error
set clipboard+=unnamed "by default copy/paste with the X11 clipboard ("* register)
set background=dark "make things look !ugly with a dark background
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ " what to show when I hit :set list
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 "always show above status line
set mouse=a "allow mouse usage in terms (scrolling, highlighting, pasting, etc.)
set mousehide " Hide the mouse when typing text
set scrolloff=5 "try to keep at least 5 lines above and bellow the cursor when scrolling
set autoindent "enable the following line
set smartindent "do the Right Thing
set expandtab "tab key -> spaces
set shiftwidth=4 "indent by 4 spaces
set tabstop=4 "tab characters are drawn as 4 spaces
set softtabstop=4 "treat 4 spaces like a tab
set showcmd "show partial commands in the right or the status area
set hidden "allow hidden buffers. VERY GOOD. see help
set nobackup "dont make those filename~ files (they have bitten me many times)
set noswapfile "more trouble than they're worth
set wildmenu "show possible completions in command (:) mode (try hitting tab twice)
set wildmode=list:longest,full "make the wildmenu behave more like bash
set ignorecase "dont care about case in searches, etc.
set smartcase "care about case if I enter any capital letters
let mapleader = ',' "use , instead of \ as the 'leader' key (used in some plugins)
set nostartofline "don't go to the start of line after certain commands
set textwidth=80 "wrap at 80 chars
set formatoptions-=o "don't insert comment chars when I hit o or O
"set formatoptions+=a "automatically reflow comment blocks (:h fo-table)

let python_highlight_all=1 "highlight everything possible in python
let python_highlight_space_errors=0 "except spacing issues
let perl_extended_vars=1 " highlight advanced perl vars inside strings

set number "show line numbers
"hit F11 to toggle line numbers
nnoremap <silent><F11> :set number!<CR> 

"TagList plugin settings
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Use_Right_Window = 1
let Tlist_Show_Menu = 1
let Tlist_Display_Prototype = 0
nnoremap <silent><F7> :w<CR>:TlistUpdate<CR>
nnoremap <silent><F8> :Tlist<CR>

nnoremap <silent><F9> :w<CR>:!pylint -e %<CR>

nnoremap <C-]> g<C-]>

nnoremap <C-s> :wa<CR>
vnoremap <C-c> "+y

"use control-[hjkl] to move between windows
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-h> <C-w>h

"use shift-[hl] to move between buffers (tabs if you use MiniBufExplorer)
nnoremap <silent><S-h> :bp<CR>
nnoremap <silent><S-l> :bn<CR>

"disable this when in the QuickFix window
"autocmd FileType qf nunmap <S-h>
"autocmd FileType qf nunmap <S-l>
autocmd FileType qf set nospell

"dont require a shift to enter command mode
nnoremap ; :
"make shift Y behave like shift-[cd] (copy to end of line)
nnoremap Y y$

"a cool debugging line (hit _if in 'normal' (not insert) mode to try it)
nnoremap _if ofprintf(0<C-d>stderr, "{%s}:{%d} - \n", __FILE__, __LINE__);<Esc>F\i 
autocmd FileType cpp nnoremap _if ocout << __FILE__ << " " << __LINE__  << " " << __FUNCTION__ << " - " << endl;<Esc>F"i 

"Ruby stuffs
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"clicking on the 'tabs' in the MiniBufExplorer will switch to that buffer
"(even in console)
let g:miniBufExplUseSingleClick=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplorerAutoUpdate = 1
let g:miniBufExplTabWrap = 1
let g:miniBufExplForceSyntaxEnable = 0

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabMappingForward = "<tab>"


"change inside of a (single-ling) string, see :help objects
nnoremap c' ci'
nnoremap c" ci"
nnoremap cw ciw
nnoremap d' da'
nnoremap d" da"
nnoremap dw daw

autocmd FileType haskell set nospell

"use shift-w to save the file as root (I forget to use "sudo vim" a lot)
cabbr W w !sudo tee % > /dev/null

"autosave on make
cabbr make wa\|make

"better navigation of quickfix list
nnoremap <C-n> :cn<cr>
nnoremap <C-p> :cp<cr>

" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" autodetect scons files
au BufNewFile,BufRead SCons* set filetype=scons 

" configure browser for haskell_doc.vim
let g:haddock_browser = "opera"

"If using vim7 
if version >= 700
  autocmd FileType tex setlocal grepprg=grep\ -nH\ $*
  set spell "enable spell checking use ":set nospell" to turn it off for a single buffer
  set spelllang=en_us "use US dictionary for spelling
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete "use ruby auto-completion
  set completeopt=longest,menu,preview "make auto-complete less stupid
endif

" close the preview window after i'm done with it
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set exrc
set secure

"see also: my ~/.gimrc and ~/.vim directory
