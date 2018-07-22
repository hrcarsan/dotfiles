" INTERFACE
syntax on                      " enable syntax highlight
filetype plugin on             " enable ftplugin/ load type specific configs
filetype indent off            " disable autoident

" theme
let g:easycolor_path = expand('~/.config/nvim/colors/native.json')
colorscheme easycolors         " set the current theme

let g:terminal_color_0  = g:easycolor['palette']['Sage']['hex']
let g:terminal_color_1  = g:easycolor['palette']['AppleRed']['hex']
let g:terminal_color_2  = g:easycolor['palette']['DarkGreen']['hex']
let g:terminal_color_3  = g:easycolor['palette']['DarkOrange']['hex']
let g:terminal_color_4  = g:easycolor['palette']['HonoluluBlue']['hex']
let g:terminal_color_5  = g:easycolor['palette']['DarkMagenta']['hex']
let g:terminal_color_6  = g:easycolor['palette']['SpringGreen']['hex']
let g:terminal_color_7  = g:easycolor['palette']['Blonde']['hex']
"let g:terminal_color_8  = g:easycolor['palette']['Tan']['hex']
let g:terminal_color_9  = g:easycolor['palette']['Maroon']['hex']
let g:terminal_color_10 = g:easycolor['palette']['Brown']['hex']
let g:terminal_color_11 = g:easycolor['palette']['Ginger']['hex']
let g:terminal_color_12 = g:easycolor['palette']['OxfordBlue']['hex']
let g:terminal_color_13 = g:easycolor['palette']['DarkCoral']['hex']
let g:terminal_color_14 = g:easycolor['palette']['DarkMagenta']['hex']
let g:terminal_color_15 = g:easycolor['palette']['Blonde']['hex']
let g:terminal_color_16 = g:easycolor['palette']['EerieBlack']['hex']
let g:terminal_color_17 = g:easycolor['palette']['EerieBlack']['hex']

set termguicolors              " enable True Color (16 million colors)
"set t_Co=256                  " enable 256 colors
set mouse=a                    " enable mouse in all modes, to copy/paste as usualy in terminal press the shift key
"set lazyredraw                 " avoid redraw the screen allways
set scrolloff=3                " keep 3 lines below and above the cursor when move vertical
set noshowmode                 " do not show if is in normal, insert, visual, airline do this
set nowrap                     " does not wrap the line
"set spell                      "turns on spell checking
set laststatus=2               " always show status line, for airline
set backspace=indent,eol,start " allow delete with backspace
set number                     " show line numbers
let loaded_matchparen = 1      " highlight parenthesis, uncomment to disable
"set updatetime=100             " time to refresh the gutter signs
set synmaxcol=180 

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

" OTHERS
let g:netrw_dirhistmax=0       " disable netrw history

" create metafiles the dirs
if !isdirectory(expand('~/.vim/.undo'))
  execute 'silent !mkdir -p ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo ~/.vim/.session'
endif

set undodir=~/.vim/.undo/
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/

" vim-workspace
"let g:workspace_autosave = 0
"let g:workspace_nocompatible = 0
"let g:workspace_session_name = expand('$HOME/.vim/.session/'.substitute(getcwd(),'/','','g').'_session.vim')
"let g:workspace_persist_undo_history = 0
