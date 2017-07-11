if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/weathare/dotfiles/.config/nvim/init.vim', '/home/weathare/.config/dein/plugins_common.toml', '/home/weathare/.config/dein/plugins_nvim.toml', '/home/weathare/.config/dein/plugins_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/weathare/.config/dein'
let g:dein#_runtime_path = '/home/weathare/.config/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/weathare/.config/dein/.cache/init.vim'
let &runtimepath = '/home/weathare/.config/dein/repos/github.com/Shougo/dein.vim/,/home/weathare/.config/nvim,/etc/xdg/nvim,/home/weathare/.local/share/nvim/site,/usr/local/share/nvim/site,/home/weathare/.config/dein/repos/github.com/neomake/neomake,/home/weathare/.config/dein/repos/github.com/Shougo/denite.nvim,/home/weathare/.config/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/home/weathare/.linuxbrew/Cellar/neovim/0.2.0/share/nvim/runtime,/home/weathare/.config/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/weathare/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/weathare/.config/nvim/after'
filetype off
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Watson call dein#autoload#_on_cmd('Watson', 'vim-unite-watson.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
let g:AutoPairsMapSpace = 0
let g:thub_complete_emoji_japanese_workaround = 1
let g:sass_complite_auto = 0
let g:sass_complite_file = ['sass', 'scss']
let g:sass_complite_dir = ['css', 'stylesheets']
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
autocmd BufNewFile,BufRead *.haml setlocal filetype=haml
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
nmap  <C-_> <Plug>(caw:hatpos:toggle)
vmap  <C-_> <plug>(caw:hatpos:toggle)
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  setlocal spell
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  end
  imap <buffer><C-j>  <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-k>  <Plug>(committia-scroll-diff-up-half)
endfunction
map _ <Plug>(operator-replace)
let g:gitgutter_enabled = 0
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
au FileType go nmap ,gr <Plug>(go-run)
au FileType go nmap ,gb <Plug>(go-build)
au FileType go nmap ,gs <Plug>(go-test)
au FileType go nmap ,gc <Plug>(go-coverage)
nnoremap ,rs :RunSpec<CR>
nnoremap ,rl :RunSpecLine<CR>
nnoremap ,re :RunSpecLastRun<CR>
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:monster#completion#rcodetools#backend = "async_rct_complete"
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['deoplete-go'])
