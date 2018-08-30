call plug#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        INTERFACE
" TODO:
" - support term colors and identline color in easycolors, fzf too
" - hightlight support for go, angular
" - support hightlight php and js inside html
" - when search the hightlight color is ugly
" - check nerdfonts, not all icons are supported with roboto
"   https://github.com/ryanoasis/nerd-fonts/blob/master/bin/scripts/test-fonts.sh
" - test 'itchyny/lightline.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'santiagohecar/easycolors.vim' " themes handler
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'yggdroot/indentline'
Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' } " Show hightlighted hex colors
Plug 'google/vim-searchindex' " show the total of the search matches
Plug 'moll/vim-bbye' " avoid close window when close a buffer
Plug 'yuttie/comfortable-motion.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               SYNTAX AND LANGUAGES SUPPORT
" TODO:
" - support go, angular
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'StanAngeloff/php.vim',    {'for': 'php'}
Plug 'elzr/vim-json',           {'for': 'json'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
"Plug 'adoy/vim-php-refactoring-toolbox'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      LINTER ENGINE
" TODO:
" - learn about linting
" - support go
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
" - do something to avoid the caps lock in normal mode
" - there are something better than nerdcommenter?
" - study emmet
" - map commands to go to next and previous trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular',       {'on': 'Tabularize'}
Plug 'valloric/matchtagalways', {'for': 'html'}
Plug 'alvan/vim-closetag',      {'for': 'html'}
"Plug 'mattn/emmet-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       AUTOCOMPLETION
" TODO:
" - improve the tags
" - test 'lvht/phpcd.vim' for php7
" - study ternjs http://ternjs.net/ and test 'ternjs/tern_for_vim'
" - would be good show the signature of the functions and the file
"   tags come, test better Shougo/echodoc.vim
" - snippets
" - now is showing an error in command line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if !has('nvim') " dependencies needed for deoplete on vim8
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-tagprefix'
"Plug 'Shougo/neco-syntax'
"Plug 'ncm2/ncm2-syntax'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       UTILITIES
" TODO:
" - improve the tags
" - check php actor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'danro/rename.vim' , { 'on': 'Rename' }
"Plug 'thaerkh/vim-workspace'

call plug#end()

