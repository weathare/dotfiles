set runtimepath+=$HOME/.fzf

" fzf選択ファイルの vsplit
let g:fzf_action = {
  \ 'ctrl-v': 'vsplit'
  \ }

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'enew' }

let g:fzf_history_dir = '$XDG_CONFIG_HOME/cache/fzf-history'

nnoremap [fzf]     <Nop>
nmap     <Leader>f [fzf]

if executable('rg')
  " search all files
  let g:rg_all_command = '
        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
        \ '
  command! -bang -nargs=* FindAll
        \ call fzf#vim#grep(
        \ g:rg_all_command . shellescape(<q-args>),
        \ 1,
        \ <bang>0
        \ )
  nnoremap [fzf]a    :<C-u>FindAll<cr>

  " search no-ignore files
  let g:rg_command = '
        \ rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --color "always"
        \ -g "!{.bundle,.git,node_modules,vendor}/*"
        \ '
  command! -bang -nargs=* Find call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
  nnoremap [fzf]f    :<C-u>Find<cr>
endif

