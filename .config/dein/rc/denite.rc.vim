call denite#custom#option('default', 'prompt', '>')

" denite/insert 時、C- で移動
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

" vsplit キーバインドを割り当て
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" jj で denite/insert を抜ける
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--hidden', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
endif

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/', 'node_modules',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

nnoremap  [denite]  <Nop>
nmap      <Leader>d [denite]
nnoremap  [denite]t :<C-u>Denite filetype<cr>
