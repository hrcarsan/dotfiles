call plug#begin()

" Interface
Plug 'santiagocardona/native'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
"Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'
Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' }

" Syntax 
Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

" Syntax checker
Plug 'w0rp/ale'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Edition
Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs'
"Plug 'godlygeek/tabular'
"Plug 'valloric/matchtagalways'
"Plug 'git@github.com:alvan/vim-closetag.git'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'mattn/emmet-vim'

" Utilities --------------------------

"Rename the current file, usage :Rename NewFileName.js
Plug 'danro/rename.vim' , { 'on': 'Rename' }
"Plug 'ntpeters/vim-better-whitespace'

"Plug 'thaerkh/vim-workspace'
"Plug 'adoy/vim-php-refactoring-toolbox'

"Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc.vim'
"Plug 'kristijanhusak/deoplete-phpactor'

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

call plug#end()
