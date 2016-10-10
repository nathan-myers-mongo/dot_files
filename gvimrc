" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"             for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"           for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2                " Make command line two lines high


" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background

  let s:usingWombat = 1
  if s:usingWombat
      try
          "colorscheme solarized
          "colorscheme wombat
          colorscheme wombat256
      catch
          let s:usingWombat = 0
      endtry
  endif

  if !s:usingWombat
      highlight Normal guibg=black guifg=grey
      highlight NonText guibg=black guifg=magenta
      highlight Cursor guibg=Green guifg=NONE
      highlight lCursor guibg=Cyan guifg=NONE
      highlight PMenu guibg=brown gui=bold
      highlight Folded guibg=#333333 
      highlight FoldColumn	 guibg=#333333 
      highlight LineNr	 guibg=#1a1a1a
      highlight Visual	 gui=inverse guibg=black
  endif

  set background=dark

  "highlight MyCurword guibg=#134
  highlight MyCurword guibg=#111122 gui=bold guifg=white
  " cterm=bold ctermfg=white
  autocmd InsertEnter *.{cpp,c,h} syntax clear MyCurword
  autocmd CursorHold *.{cpp,c,h} syntax clear MyCurword | if len(expand('<cword>')) && match(expand('<cword>'), '\W') == -1 | exe "syntax keyword MyCurword " . expand("<cword>") |endif 

  set guioptions-=T
  set guifont=Monospace\ 9

  " Use images for ycm errors
  let g:ycm_error_symbol='EE icon=/usr/share/icons/gnome/16x16/status/dialog-error.png'
  let g:ycm_warning_symbol='WW icon=/usr/share/icons/gnome/16x16/status/dialog-warning.png'

endif

