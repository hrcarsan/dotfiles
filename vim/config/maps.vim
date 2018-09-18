scriptencoding uft-8

let mapleader = ','

" open vim configuration in a new window
nnoremap <leader>ve :vsplit $HOME/dotfiles/vim/.vimrc<cr>

" source vim configuration
nnoremap <leader>vs :source $MYVIMRC<cr>:noh<cr>h

" open highlight colors
nnoremap <leader>hi :execute 'vsplit '.g:easycolor_path<cr>

" save a file
"nnoremap <leader>w :silent w<cr>:<c-c>

" quit
nnoremap <leader>q :qa<cr>

" <c-]> is the default vim map go to definition
nnoremap gd <c-]>

nnoremap Y y$

" add \v (magic regex) to do normal regex searchs
"nnoremap / /\v
"vnoremap / /\v
"nnoremap ? ?\v
"vnoremap ? ?\v

" highlight the word under cursor
nnoremap <leader>n *N
vnoremap <leader>n y/<c-r>"<cr>

" remove search higlight
nnoremap <leader><space> :noh<cr>

" buffers: previous, next, close
nnoremap <c-h> :bp<cr>:<c-c>
nnoremap <c-l> :bn<cr>:<c-c>
nnoremap <c-x> :Bd<cr>

" move lines down/up
nnoremap - :m .+1<cr>==
nnoremap _ :m .-2<cr>==

" enclosed width "quotes"
nmap <leader>" ysiw"
nmap <leader>' ysiw'
vmap <leader>" S"
vmap <leader>' S'

nnoremap <leader>fc :%s/\r//g<cr>

" return to normal mode
inoremap <c-c> <esc>
nnoremap <c-c> <c-c>:<c-c>

" cut/copy/paste to/from clipboard
vnor <c-x> "+x
vnor <c-y> "+y
inor <c-v> <C-O>:set paste<CR><C-R>+<C-O>:set nopaste<CR>
vnor <c-v> :<C-U>set paste<CR>gvc<C-R>+<C-O>:set nopaste<CR><ESC>

nmap ,fn :let @+=expand("%:t")<CR>

" save workspace
"nnoremap <leader>tw :ToggleWorkspace<CR>

nnoremap <leader>c :GitGutterToggle<cr>
nnoremap <leader>z Vi{zfkj

" Show hi group under cursor
map <leader>hs :call ShowHi()<cr>


function! ShowHi()

  let hi    = synIDattr(synID(line('.'), col('.'), 1), 'name')
  let trans = synIDattr(synID(line('.'), col('.'), 0), 'name')
  let lo    = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

  echo 'hi<'.hi.'> trans<'.trans.'> lo<'.lo.'>'

endfunction

"tnoremap <Esc> <C-\><C-n>
"tnoremap <c-c> <C-\><C-n>

" move down/up in complete panel with tab and shitf + tab
inoremap <expr><tab>   pumvisible()? "\<c-n>": "\<tab>"
inoremap <expr><s-tab> pumvisible()? "\<c-p>": "\<s-tab>"

