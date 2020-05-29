call plug#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        INTERFACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'santiagohecar/easycolors.vim' " themes handler
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' } " Show hightlighted hex colors
Plug 'google/vim-searchindex' " show the total of the search matches
Plug 'moll/vim-bbye' " avoid close window when close a buffer
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
"Plug 'morhetz/gruvbox'
"Plug 'majutsushi/tagbar'

Plug 'santiagohecar/vista.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               SYNTAX AND LANGUAGES SUPPORT
" TODO:
" - support angular
" - support hightlight php and js inside html
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'StanAngeloff/php.vim',    {'for': 'php'}
Plug 'santiagohecar/php.vim',    {'for': 'php'}
Plug 'elzr/vim-json',           {'for': 'json'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
"Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'c9s/phpunit.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      LINTER ENGINE
" TODO:
" - setup fixers
" - customize linters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'w0rp/ale'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'      " fuzzy finder for files, tags, etc...
Plug 'santiagohecar/fif.vim' " Find in Files


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
" - there are something better than nerdcommenter?
" - study emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular',       {'on': 'Tabularize'}
Plug 'valloric/matchtagalways', {'for': 'html'}
Plug 'alvan/vim-closetag',      {'for': 'html'}
Plug '907th/vim-auto-save'
"Plug 'mattn/emmet-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       AUTOCOMPLETION
" TODO:
" - improve the tags
" - ctags for go
" - test 'lvht/phpcd.vim' for php7
" - study ternjs http://ternjs.net/ and test 'ternjs/tern_for_vim'
" - would be good show the signature of the functions and the file
"   tags come, test better Shougo/echodoc.vim
" - snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if !has('nvim') " dependencies needed for deoplete on vim8
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'neoclide/coc-sources'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = ['coc-tsserver',
                             \ 'coc-phpls',
                             \ 'coc-emmet',
                             \ 'coc-css',
                             \ 'coc-html',
                             \ 'coc-json',
                             \ 'coc-prettier',
                             \ 'coc-tag']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       UTILITIES
" TODO:
" - check php actor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'danro/rename.vim' , { 'on': 'Rename' }
"Plug 'thaerkh/vim-workspace'


call plug#end()

