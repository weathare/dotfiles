if filereadable(expand('$XDG_CONFIG_HOME/.slack_memo_profile'))
  source $XDG_CONFIG_HOME/.slack_memo_profile
endif

let g:slack_memo_bot_username = 'weathare'
let g:slack_memo_bot_icon_emoji = ':vim:'
nnoremap sme :16split enew<cr>:set ft=markdown<cr>gI
nnoremap smp :SlackMemoPost<cr>
nnoremap sml :SlackMemoList<cr>:set modifiable<cr>
