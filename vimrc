" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

runtime! bundle.vim

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
" Load configurations

runtime! settings/base.vim
runtime! settings/spelling.vim
runtime! settings/search.vim
runtime! settings/format.vim
runtime! settings/mappings.vim
runtime! settings/styles.vim

for f in split(glob('~/.vim/settings/plugins/*.vim'), '\n')
  exe 'source' f
endfor
