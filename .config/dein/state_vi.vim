if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/weathare/.vimrc', '/home/weathare/.config/dein/plugins_common.toml', '/home/weathare/.config/dein/plugins_vim.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/weathare/.config/dein'
let g:dein#_runtime_path = '/home/weathare/.config/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/weathare/.config/dein/.cache/.vimrc'
let &runtimepath = '/home/weathare/.config/dein/repos/github.com/Shougo/dein.vim/,/home/weathare/.vim,/var/lib/vim/addons,/home/weathare/.config/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/home/weathare/.config/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/weathare/.vim/after'
filetype off
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:gitgutter_enabled = 0
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
nmap  <C-_> <Plug>(caw:hatpos:toggle)
vmap  <C-_> <plug>(caw:hatpos:toggle)
let g:AutoPairsMapSpace = 0
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
