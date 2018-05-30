
  " basics
  syntax on
  filetype indent off

  set termguicolors
  set nomodeline
  set encoding=utf8
  set mouse=a
  set t_Co=256
  set lazyredraw
  set scrolloff=3
  set noshowmode
  set hidden
  set ttyfast
  set undofile
  set nowrap
  "set spell "turns on spell checking

  " for searchs
  set ignorecase
  set smartcase
  set gdefault
  set incsearch
  set showmatch
  set hlsearch

  " always show status line
  set laststatus=2

  " allow delete with backspace
  set backspace=indent,eol,start

  "indentation
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab

  " fold
  set foldcolumn=0
  set foldtext=""

  " show line numbers
  set number

  " create metafiles the dirs 
  if !isdirectory(expand('~/.vim/.undo'))
    execute 'silent !mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo ~/.vim/.session'
  endif

  set undodir=~/.vim/.undo/
  set backupdir=~/.vim/.backup/
  set directory=~/.vim/.swp/

  " theme
  colorscheme native

  " globals
  let loaded_matchparen = 1

  " php.vim
  let g:php_sql_heredoc = 0
  let g:php_html_in_heredoc = 0
  let g:pho_sql_nowdoc = 0
  let g:php_html_in_nowdoc = 0

  " vim-gitgutter
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
  let g:gitgutter_enabled = 0

  " indentline
  let g:indentLine_enabled = 1
  let g:indentLine_char = "\ue621"
  let g:indentLine_color_term = 101
  let g:indentLine_color_gui = '#87875f'

  "vim-json
  let g:vim_json_syntax_conceal = 0

  " vim-workspace
  "let g:workspace_autosave = 0
  "let g:workspace_nocompatible = 0
  "let g:workspace_session_name = expand('$HOME/.vim/.session/'.substitute(getcwd(),'/','','g').'_session.vim')
  "let g:workspace_persist_undo_history = 0
