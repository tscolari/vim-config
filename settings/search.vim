" ================ Search Settings  =================

set incsearch       " Find the next match as we type the search
set hlsearch        " Hilight searches by default
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :Ag <cword><CR>

" grep visual selection
vnoremap K :<C-U>execute "Ag " . GetVisual()<CR>

" ,gg = Grep! - using Ag the silver searcher
"  open up a grep line, with a quote started for the search
nnoremap ,gg :Ag ""<left>
