" INTERFACE
syntax on                      " enable syntax highlight
filetype plugin on             " enable ftplugin/ load type specific configs
filetype indent off            " disable autoident

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum" " italic support in tmux
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum" " italic support in tmux
set termguicolors                    " enable True Color (16 million colors)

let g:easycolor_path = $HOME."/.config/nvim/colors/pro-light.json"
silent! colorscheme easycolors " set the current theme

set number                     " show line numbers
set scrolloff=3                " keep 3 lines below and above the cursor when move vertical
set nowrap                     " does not wrap the line
set noshowmode                 " do not show if is in normal, insert, visual, airline do this
set laststatus=2               " always show status line, for airline
set completeopt=menu           " show menu for completion
set noruler                    " hide line,col from the status line
set lazyredraw                 " avoid redraw the screen allways (possibly issue with column number)
"set spell                      "turns on spell checking
set synmaxcol=150              " only higlighted to that column
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
set colorcolumn=110
set cursorline                 " could made slow the scrolling?
set rnu                        " relative numbers
set signcolumn=yes
set nobackup
set nowritebackup
"set iskeyword+=-               " treat - as part of word

" open new split panes to right and below
"set splitright
set splitbelow

" turn terminal to normal mode with escape
"tnoremap <c-c> <C-\><C-n>
" start terminal in insert mode
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
"function! OpenTerminal()
  "split term://bash
  "resize 10
"endfunction
"nnoremap <c-t> :call OpenTerminal()<CR>

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
"set foldcolumn=0               " hide fold column
set foldtext=""                " do not show first line of the folded text
set fillchars=eob:.

" OTHERS
let g:netrw_dirhistmax=0       " disable netrw history

" create metafiles the dirs
if !isdirectory(expand('~/.config/nvim/.undo'))
  execute 'silent !mkdir -p ~/.config/nvim/.backup ~/.config/nvim/.swp ~/.config/nvim/.undo ~/.config/nvim/.session'
endif

set undodir=~/.config/nvim/.undo
set backupdir=~/.config/nvim/.backup
set directory=~/.config/nvim/.swp//

" vim-workspace
"let g:workspace_autosave = 0
"let g:workspace_nocompatible = 0
"let g:workspace_session_name = expand('$HOME/.vim/.session/'.substitute(getcwd(),'/','','g').'_session.vim')
"let g:workspace_persist_undo_history = 0

command! -complete=shellcmd -nargs=+ New call s:NewFile(<q-args>)

function! s:NewFile(filename)

  execute 'silent !touch '.a:filename.
        \ ' && chown $UGID '.a:filename.
        \ ' && chmod 775 '.a:filename

  execute "edit ".a:filename
endfunction

let g:colorizer_colornames = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore scroll position when change buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
  if !exists("w:SavedBufView")
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
  let buf = bufnr("%")
  if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff
        call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

