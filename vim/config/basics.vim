" INTERFACE
syntax on                      " enable syntax highlight
filetype plugin on             " enable ftplugin/ load type specific configs
filetype indent off            " disable autoident
silent! colorscheme easycolors " set the current theme
set termguicolors              " enable True Color (16 million colors)
set number                     " show line numbers
set scrolloff=3                " keep 3 lines below and above the cursor when move vertical
set nowrap                     " does not wrap the line
set noshowmode                 " do not show if is in normal, insert, visual, airline do this
set laststatus=2               " always show status line, for airline
set completeopt=menu           " show menu for completion
set noruler                    " hide line,col from the status line
"set lazyredraw                 " avoid redraw the screen allways (shown the cursor in the ruler)
"set spell                      "turns on spell checking
set synmaxcol=180              " only higlighted to that column
set updatetime=100             " time to refresh the gutter signs
set textwidth=0                " 0 to avoid the text be wraped until write
let loaded_matchparen = 1      " highlight parenthesis, uncomment to disable
set shortmess+=c               " suppress message match x of x
set noshowcmd                  " not show the current typed normal command
set mouse=a                    " enable mouse in all modes, to copy/paste as usualy in terminal press the shift key
"set ttimeout
"set ttimeoutlen=10
set redrawtime=10000           " avoid disable syntax for large files
set guicursor=                 " fix for 'q' chars in some terminals

" FILE
set backspace=indent,eol,start " allow delete with backspace
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
set grepprg=rg\ --vimgrep      " use ripgrep instead of grep

" INDENTATION
set autoindent                 " keep the indentation of the current line to the created bellow and above
set tabstop=2                  " set the indent with to two spaces
set shiftwidth=2               " set the indent with to two spaces, used for >><<
set softtabstop=2              " set the indent with to two spaces
set expandtab                  " use spaces instead of tabs

" FOLD
set foldcolumn=0               " hide fold column
set foldtext=""                " do not show first line of the folded text

" OTHERS
let g:netrw_dirhistmax=0       " disable netrw history

" create metafiles the dirs
if !isdirectory(expand('~/.config/nvim/.undo'))
  execute 'silent !mkdir -p ~/.config/nvim/.backup ~/.config/nvim/.swp ~/.config/nvim/.undo ~/.config/nvim/.session'
endif

set undodir=~/.config/nvim/.undo
set backupdir=~/.config/nvim/.backup
set directory=~/.config/nvim/.swp

" vim-workspace
"let g:workspace_autosave = 0
"let g:workspace_nocompatible = 0
"let g:workspace_session_name = expand('$HOME/.vim/.session/'.substitute(getcwd(),'/','','g').'_session.vim')
"let g:workspace_persist_undo_history = 0

command! -complete=shellcmd -nargs=+ New call s:NewFile(<q-args>)

function! s:NewFile(filename)

  execute 'silent !touch '.a:filename.
        \ ' && chown $UGID '.a:filename.
        \ ' && chmod 664 '.a:filename

  execute "edit ".a:filename
endfunction

