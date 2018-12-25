  "_________              __  .__
 "/   _____/____    _____/  |_|__|____     ____   ____
 "\_____  \\__  \  /    \   __\  \__  \   / ___\ /  _ \
 "/        \/ __ \|   |  \  | |  |/ __ \_/ /_/  >  <_> )
"/_______  (____  /___|  /__| |__(____  /\___  / \____/
        "\/     \/     \/             \//_____/
       ".__                         __
 "___  _|__| _____     ______ _____/  |_ __ ________
 "\  \/ /  |/     \   /  ___// __ \   __\  |  \____ \
  "\   /|  |  Y Y  \  \___ \\  ___/|  | |  |  /  |_> >
   "\_/ |__|__|_|  / /____  >\___  >__| |____/|   __/
                "\/       \/     \/           |__|

source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/basics.vim
source $HOME/.config/nvim/config/maps.vim
source $HOME/.config/nvim/config/airline.vim
source $HOME/.config/nvim/config/indentline.vim
source $HOME/.config/nvim/config/nerdtree.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/deoplete.vim
source $HOME/.config/nvim/config/ale.vim
source $HOME/.config/nvim/config/ctags.vim
source $HOME/.config/nvim/config/git.vim
source $HOME/.config/nvim/config/json.vim
source $HOME/.config/nvim/config/tabular.vim
source $HOME/.config/nvim/config/comfortable_motion.vim
source $HOME/.config/nvim/config/fif.vim
source $HOME/.config/nvim/config/better_whitespace.vim
source $HOME/.config/nvim/config/go.vim
source $HOME/.config/nvim/config/auto_save.vim

let g:phpunit_testroot = ''
let g:phpunit_bin = 'webdcs/tests/run'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           BASICS
"
" <c-o>     go to the older cursor position
" <c-i>     go to the newer cursor position
" gd        go to definition
"
" [[        go to the previous function
" ]]        go to the next function
"
" [{        go to the opening curly bracket
" ]}        go to the closing curly bracket
"
" [(        go to the opening parentheses
" ])        go to the closing parentheses
"
" [w        go to the previos trailing whitespace
" ]w        go to the next trailing whitespace
"
"           start record commands with q{a-z}, stop with q
"           apply the macro with @{a-z}
" qqaword ^cq@q@q to word word word
"
" :verbose set property?  see where is defined a property
"
" g<c-g>    visual, count selection
"
" :g/^\s*$/d delete empty lines
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           EDITION
"
" ,i         toggle indent lines
"
"            ,s<object> clean whitespace
" ,s<space>  clean line of trailing whitespaces
"
"            cs<surrond><surround> change surround
"            <surrond>  " ' ( ) [ ] { } <tag> > t
" cs"'       "word" to 'word'
" cs"<i>     'word' to <i>word<i>
" cst"       <i>word<i> to "word"
" cs)]       (word) to [word]
"
"            ds<surrond> delete surround
" ds"        "word" to word
"
"            ys<object><surrond> add surround
" yss"       entire line to "entire line"
" ysiw<i>    word to <i>word<i>
"
"            v<object>S<surrond> surround in visual mode
" viwS'      word to 'word'
"
"            autopairs (insert mode) | represents the cursor
" |( to (|)
" |[ to [|]
" "|<bs>" to <empty>
" (|<a-e>)word to (word)|
"                           (normal mode)
" <a-p>     toggle autopairs
" <a-n>     move to the next close autopair char
"
" ,a=       align = above and below to the same column
" ,a:       align = above and below to the same column
"
" <tag|> to <tag>|</tag>
" <tag>|></tag> to <tag>
"                    |
"                  </tag>
"
"           change a word at n positions
"           with ,ncgn the repeat with .
" wo|rd type ,ncgnnew_word<c-c>..    new_word
" word                               new_word
" word                               new_word
"           using visual block
" |word type <c-v>jjInew_<c-c>   new_word
"  word                          new_word
"  word                          new_word
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           UTILITIES
"
" :Rename {name}  Rename the current file

