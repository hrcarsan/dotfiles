" INTERFACE
syntax on                      " enable syntax highlight
filetype indent off            " disable autoident
set termguicolors              " enable True Color (16 million colors)
"set t_Co=256                  " enable 256 colors
set mouse=a                    " enable mouse in all modes, to copy/paste as usualy in terminal press the shift key
set lazyredraw                 " avoid redraw the screen allways
set scrolloff=3                " keep 3 lines below and above the cursor when move vertical
set noshowmode                 " do not show if is in normal, insert, visual, airline do this
set nowrap                     " does not wrap the line
"set spell                      "turns on spell checking
set laststatus=2               " always show status line, for airline
set backspace=indent,eol,start " allow delete with backspace
set number                     " show line numbers
"let loaded_matchparen = 1      " highlight parenthesis
set updatetime=100             " time to refresh the gutter signs

" THEME
colorscheme native             " set the current theme

" FILE
set nomodeline                 " modelines comes in some files, are used to set local buffer configs
set encoding=utf8              " support unicode chars
set undofile                   " keep a file of undo history
set hidden                     " avoid unload non active buffers

" SEARCH
set ignorecase                 " insensitive case on searchs
set smartcase                  " become sensitive case when include uppercase in the search
"set gdefault                  " replace all matches in the line
set incsearch                  " hightlight the first match when search
set noshowmatch                " avoid jump to ( when type )
set hlsearch                   " keep the matches higlighted after search

" INDENTATION
set autoindent                 " keep the indentation of the current line to the created bellow and above
set tabstop=2                  " set the indent with to two spaces
set shiftwidth=2               " set the indent with to two spaces, used for >><<
set softtabstop=2              " set the indent with to two spaces
set expandtab                  " use spaces instead of tabs

" FOLD
set foldcolumn=0               " hide fold column
set foldtext=""                " do not show first line of the folded text

" create metafiles the dirs
if !isdirectory(expand('~/.vim/.undo'))
  execute 'silent !mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo ~/.vim/.session'
endif

set undodir=~/.vim/.undo/
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/

let g:netrw_dirhistmax=0

" php.vim
"let g:php_sql_heredoc = 0
"let g:php_html_in_heredoc = 0
"let g:pho_sql_nowdoc = 0
"let g:php_html_in_nowdoc = 0

" vim-workspace
"let g:workspace_autosave = 0
"let g:workspace_nocompatible = 0
"let g:workspace_session_name = expand('$HOME/.vim/.session/'.substitute(getcwd(),'/','','g').'_session.vim')
"let g:workspace_persist_undo_history = 0
