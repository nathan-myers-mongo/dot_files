setlocal encoding=utf-8
setlocal textwidth=0
setlocal linebreak
nnoremap <buffer> k gk
nnoremap <buffer> j gj
nnoremap <buffer> <Up> gk
nnoremap <buffer> <Down> gj
nnoremap <buffer> 0 g0
nnoremap <buffer> ^ g^
nnoremap <buffer> $ g$
inoremap <buffer> <Up> <C-O>gk
inoremap <buffer> <Down> <C-O>gj
vnoremap <buffer> k gk
vnoremap <buffer> j gj
vnoremap <buffer> <Up> gk
vnoremap <buffer> <Down> gj
vnoremap <buffer> 0 g0
vnoremap <buffer> ^ g^
vnoremap <buffer> $ g$
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
setlocal spell
