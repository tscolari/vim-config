let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_snippet_engine = "ultiSnips"

nnoremap <silent> ,g :GoTest<CR>

function! vimgo#generate_project()
  call system('find . -iname "*.go" > /tmp/gotags-filelist-project')
  let gopath = substitute(system('go env GOPATH'), '\n', '', '')
  call vimproc#system_bg('gotags -silent -L /tmp/gotags-filelist-project > ' . gopath . '/tags')
endfunction

function! vimgo#generate_global()
  call system('find `go env GOROOT GOPATH` -iname "*.go" > /tmp/gotags-filelist-global')
  let gopath = substitute(system('go env GOPATH'), '\n', '', '')
  call vimproc#system_bg('gotags -silent -L /tmp/gotags-filelist-global > ' . gopath . '/tags')
endfunction

function! vimgo#buffcommands()
  command! -buffer -bar -nargs=0 GoTags call vimgo#generate_project()
  command! -buffer -bar -nargs=0 GoTagsGlobal call vimgo#generate_global()
  setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
endfunction

function! vimgo#syn_if_longfile(param)
  let l:linecount = line('$')
  if linecount > 1500
    execute "syn ".a:param
  endif
endfunction

let s:projections = {
      \ '*': {},
      \ '*.go': {'type': 'go', 'alternate': ['{}_test.go']},
      \ '*_suite_test.go': {'type': 'suite'},
      \ '*_test.go': {
      \   'type': 'test',
      \   'alternate': '{}.go'}}

function! s:ProjectionistDetect() abort
  if &ft=='go'
    let projections = deepcopy(s:projections)
    call projectionist#append(getcwd(), projections)
  endif
endfunction

augroup go_projectionist
  autocmd!
  autocmd User ProjectionistDetect call s:ProjectionistDetect()
augroup END

augroup go_fastgo
  autocmd!
  autocmd BufWritePre *.go call vimgo#syn_if_longfile('off')
  autocmd BufWritePost *.go call vimgo#syn_if_longfile('on')
augroup END

if exists("g:disable_gotags_on_save") && g:disable_gotags_on_save
  augroup go_gotags
    autocmd!
    autocmd BufWritePost *.go call vimgo#generate_project()
    autocmd BufWritePost *.go call vimgo#generate_global()
  augroup END
endif
