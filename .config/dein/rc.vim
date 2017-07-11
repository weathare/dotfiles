if &compatible
  set nocompatible
endif

let g:python_host_prog  = expand('$HOME/.anyenv/envs/pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('$HOME/.anyenv/envs/pyenv/versions/neovim3/bin/python')

let s:nvim_path = expand('$XDG_CONFIG_HOME/nvim')
let s:dein_path = expand('$XDG_CONFIG_HOME/dein')
let s:dein_repo_path = expand(s:dein_path . '/repos/github.com/Shougo/dein.vim')
let $CACHE = expand('$XDG_CONFIG_HOME/cache')

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

if !isdirectory($CACHE)
  call mkdir(expand($CACHE), 'p')
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let s:common_toml = s:dein_path . '/plugins_common.toml'
  let s:nvim_toml   = s:dein_path . '/plugins_nvim.toml'
  let s:vim_toml    = s:dein_path . '/plugins_vim.toml'
  let s:lazy_toml   = s:dein_path . '/plugins_lazy.toml'

  call dein#load_toml(s:common_toml, {'lazy': 0})

  if has('nvim')
    call dein#load_toml(s:nvim_toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
  elseif !has('nvim')
    call dein#load_toml(s:vim_toml, {'lazy': 0})
  endif

  call dein#end()
  call dein#save_state()
endif

" 未インストールがあればインストール
if dein#check_install()
  call dein#install()
endif

augroup MyAutoCmd
  autocmd!
augroup END


if has('vim_starting')
  let g:pymode_python = 'python3'

  call dein#call_hook('source')
  call dein#call_hook('post_source')

  syntax on
  filetype plugin indent on

  if has('nvim')
    colorscheme iceberg
  elseif !has('nvim')
    set background=dark
    colorscheme hybrid
  endif
endif
