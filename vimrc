" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

source ./bundle.vim

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
" Load configurations

source ./settings/base.vim
source ./settings/spelling.vim
source ./settings/search.vim
source ./settings/format.vim
source ./settings/mappings.vim
source ./settings/styles.vim

for f in split(glob('~/.vim/settings/plugins/*.vim'), '\n')
  exe 'source' f
endfor
