" close
nnoremap  <silent>  ,th :call neoterm#close()<CR>
" kill
nnoremap  <silent>  ,tc :call neoterm#kill()<CR>
" toggle
nnoremap  <silent>  ,tg :Ttoggle<CR>

" rails
command! Tdbsreset :T rails db:reset
command! Tdbmreset :T rails db:migrate:reset
command! Trailss   :T rails s -b 0.0.0.0

" rubocop
command! Trbcop    :T rubocop -a %:p
