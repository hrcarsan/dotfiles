call plug#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        INTERFACE
" TODO:
" - hightlight TODO
" - hightlight support for js, ts, go, angular, css,
"   html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'santiagohecar/native'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'yggdroot/indentline'
Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               SYNTAX AND LANGUAGES SUPPORT
" TODO:
" - support javascript, typescript, go, angular, css,
"   html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'sheerun/vim-polyglot'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'elzr/vim-json', {'for': 'json'}
"Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
"Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      LINTER ENGINE
" TODO:
" - support javascript, typescript, go, angular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'w0rp/ale'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         SEARCH
" TODO:
" - support javascript, typescript, go, angular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         GIT
" TODO:
" - show lines added, modified, and remove hightlighted
" - study vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         EDITION
" TODO:
" - do something to avoid the caps lock in normal mode
" - there are something better than nerdcommenter?
" - study vim-surrond
" - study auto-pairs
" - study tabular
" - study matchtagalways
" - study vim-closetag
" - study multiple cursors
" - study emmet
" - map commands to go to next and previous trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs'
"Plug 'godlygeek/tabular'
"Plug 'valloric/matchtagalways'
"Plug 'git@github.com:alvan/vim-closetag.git'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'mattn/emmet-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       AUTOCOMPLETION
" TODO:
" - improve the tags
" - test 'lvht/phpcd.vim' for php7
" - study ternjs http://ternjs.net/ and test 'ternjs/tern_for_vim'
" - would be good show the signature of the functions and the file
"   tags come, test better Shougo/echodoc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       UTILITIES
" TODO:
" - improve the tags
" - check php actor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'danro/rename.vim' , { 'on': 'Rename' }
"Plug 'thaerkh/vim-workspace'
"Plug 'adoy/vim-php-refactoring-toolbox'

call plug#end()

