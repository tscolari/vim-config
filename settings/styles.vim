let &t_Co=256

let s:colors = [
      \ 'hybrid',
      \ 'base16-3024',
      \ 'base16-apathy',
      \ 'base16-ashes',
      \ 'base16-atelierdune',
      \ 'base16-atelierforest',
      \ 'base16-atelierheath',
      \ 'base16-atelierlakeside',
      \ 'base16-atelierseaside',
      \ 'base16-bespin',
      \ 'base16-brewer',
      \ 'base16-bright',
      \ 'base16-chalk',
      \ 'base16-codeschool',
      \ 'base16-colors',
      \ 'base16-default',
      \ 'base16-eighties',
      \ 'base16-embers',
      \ 'base16-flat',
      \ 'base16-google',
      \ 'base16-grayscale',
      \ 'base16-greenscreen',
      \ 'base16-harmonic16',
      \ 'base16-isotope',
      \ 'base16-londontube',
      \ 'base16-marrakesh',
      \ 'base16-mocha',
      \ 'base16-monokai',
      \ 'base16-ocean',
      \ 'base16-paraiso',
      \ 'base16-pop',
      \ 'base16-railscasts',
      \ 'base16-shapeshifter',
      \ 'base16-solarized',
      \ 'base16-summerfruit',
      \ 'base16-tomorrow',
      \ 'base16-twilight',
      \ ]

function! styles#_change(index)
  let l:idx = a:index
  if idx < 0
    let l:idx = len(s:colors) - 1
  elseif idx > len(s:colors) - 1
    let l:idx = 0
  endif

  let l:name = s:colors[idx]
  if !has('gui_running') && name == 'hybrid'
    silent !source $HOME/.vim/scripts/shell-colors-vim-hybrid/shell-colors-vim-hybrid.sh
  endif
  silent! execute "colorscheme ".name
endfunction

function! styles#next()
  let l:next_index = index(s:colors, g:colors_name) + 1
  call styles#_change(next_index)
endfunction

function! styles#prev()
  let l:prev_index = index(s:colors, g:colors_name) - 1
  call styles#_change(prev_index)
endfunction

function! styles#toggle_background()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

function! styles#peek()
  echo g:colors_name . ' - ' . &background
endfunction

command! ColorsPrev call styles#prev()
command! ColorsNext call styles#next()
command! ColorsToggleBG call styles#toggle_background()
command! ColorsPeek call styles#peek()

map <silent><F2> :ColorsPrev<cr>
map <silent><F3> :ColorsNext<cr>
map <silent><F4> :ColorsToggleBG<cr>
map <silent><F1> :ColorsPeek<cr>
set background=dark
let g:base16colorspace=256
call styles#_change(0)
hi MatchParen cterm=none ctermbg=black ctermfg=blue
