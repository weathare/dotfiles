" -------------------------------------
" Color: & status line
" -------------------------------------

set showcmd
set showmode
set laststatus=2

let g:lightline = {}
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ ['fileencoding', 'filetype', 'lineinfo'], ['syntastic'] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \}
if !has('nvim')
  let g:lightline.colorscheme = 'jellybeans'
endif

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

" expand('%')   カレントファイルの名前を出力
" expand('%:p') カレントファイルのフルパスを出力
" expand('%:r') カレントファイルの名前、拡張子なしを出力
" expand('%:e') カレントファイルの拡張子を出力
function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%') ? expand('%') : '[No Name]') .
          \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


function! LightLineFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

command! DeleteAnsi %s/\[[0-9;]*m//g
autocmd BufNewFile,BufRead *.log silent! :DeleteAnsi
