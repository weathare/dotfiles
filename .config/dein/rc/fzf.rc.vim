" set runtimepath+=$HOME/.fzf

let g:fzf_history_dir = '$XDG_CONFIG_HOME/cache/fzf-history'

command! FZFMru call fzf#run({
      \ 'source': v:oldfiles,
      \ 'sink': 'e',
      \ 'options': '-m -x +s',
      \ 'down': '40%'
      \})

nnoremap [fzf]     <Nop>
nmap     <Leader>f [fzf]
nnoremap <silent>  [fzf]f :<C-u>FZF<cr>
nnoremap <silent>  [fzf]m :<C-u>FZFMru<cr>
