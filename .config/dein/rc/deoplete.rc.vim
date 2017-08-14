set completeopt+=noselect
set completeopt-=preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1

" go
let g:go_fmt_command = 'goimports'
let g:deoplete#sources#go#gocode_binary = expand('$GOPATH/bin/gocode')
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#json_directory = expand('$HOME/.cache/deoplete/go/$GOOS_$GOARCH')

" ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
let g:tern#filetypes = [
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'jsx',
      \ 'vue'
      \ ]

inoremap <expr><TAB> pumvisible() ? "\<C-j>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-k>" : "\<S-TAB>"

