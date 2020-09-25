scriptencoding uft-8

let mapleader = ','

" open vim configuration in a new window
nnoremap <leader>ve :vsplit $HOME/.config/nvim/.vimrc<cr>

" source vim configuration
nnoremap <leader>vs :source $MYVIMRC<cr>:noh<cr>h

" open highlight colors
function! g:OpenHighlithColors()
  execute 'vsplit '.g:easycolor_path
  execute 'ColorHighlight'
endfunction

nnoremap <leader>hi :call g:OpenHighlithColors()<cr>

nnoremap <leader>rn :set rnu!<cr>

" save a file
nnoremap <leader>w :silent w<cr>:<c-c>

" quit
nnoremap <leader>q :qa<cr>

" <c-]> is the default vim map go to definition
nnoremap gD <c-]>

"nnoremap Y y$

" add \v (magic regex) to do normal regex searchs
"nnoremap / /\v
"vnoremap / /\v
"nnoremap ? ?\v
"vnoremap ? ?\v

" highlight the word under cursor
"function! g:SearchIndex()
  "execute "SearchIndex"
"endfunction

"function! g:HightlightWordUnder()
  "let actualView = winsaveview()
  "call feedkeys('*')
  "call timer_start(0, {timer-> winrestview(actualView)})
  "call timer_start(10, {timer-> g:SearchIndex()})
"endfunction

nnoremap <silent><expr> * v:count ? '*'
      \ : ':execute "keepjumps normal! *" <Bar> call winrestview(' . string(winsaveview()) . ')<CR>'
nnoremap <leader>n :execute "normal *"<cr>:SearchIndex<cr>

"nnoremap <silent> <leader>n :call g:HightlightWordUnder()<cr>
"vnoremap <leader>n y/<c-r>"<cr>

" remove search higlight
nnoremap <leader><space> :noh<cr>

" buffers: previous, next, close
"nnoremap <c-l> :bn<cr>:<c-c>
"nnoremap <c-h> :bp<cr>:<c-c>
nnoremap <silent><c-l> :call airline#extensions#tabline#buflist#goto_next()<cr>
nnoremap <silent><c-h> :call airline#extensions#tabline#buflist#goto_prev()<cr>
nnoremap <silent><c-x> :Bd<cr>

nnoremap <silent><a-l> :call airline#extensions#tabline#buflist#move_right()<cr>
nnoremap <silent><a-h> :call airline#extensions#tabline#buflist#move_left()<cr>

" move lines down/up
nnoremap - :m .+1<cr>==
nnoremap _ :m .-2<cr>==

" enclosed with "quotes"
nmap <leader>" ysiw"
nmap <leader>' ysiw'
vmap <leader>" S"
vmap <leader>' S'

" enclosed with [brackets]
nmap <leader>[ ysiw]
nmap <leader>{ ysiw}
nmap <leader>( ysiw)
vmap <leader>[ S]
vmap <leader>{ S}
vmap <leader>( S)

" remove \r
nnoremap <leader>rr :%s/\r//g<cr>

" return to normal mode
inoremap <c-c> <esc>
nnoremap <c-c> <c-c>:<c-c>

" cut/copy/paste to/from clipboard
vnor <c-x> "+x
vnor <c-y> "+y
"inor <c-v> <C-O>:set paste<CR><C-R>+<C-O>:set nopaste<CR>
"vnor <c-v> :<C-U>set paste<CR>gvc<C-R>+<C-O>:set nopaste<CR><ESC>

" copy the name of current file to clipboard
nmap <c-n> :let @+=expand("%:t")<CR>

" save workspace
"nnoremap <leader>tw :ToggleWorkspace<CR>

"nnoremap <leader>c :GitGutterToggle<cr>
nnoremap <leader>z Vi{zfkj

" Show hi group under cursor
map <leader>hs :call ShowHi()<cr>

function! ShowHi()
  let hi    = synIDattr(synID(line('.'), col('.'), 1), 'name')
  let trans = synIDattr(synID(line('.'), col('.'), 0), 'name')
  let lo    = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

  echo 'hi<'.hi.'> trans<'.trans.'> lo<'.lo.'>'
endfunction

nmap <leader>tt :FloatermNew<cr>

tnoremap <Esc> <C-\><C-n>
"tnoremap <c-c> <C-\><C-n>

" move down/up in complete panel with tab and shitf + tab
"inoremap <expr><tab>   pumvisible()? "\<c-n>": "\<tab>"
"inoremap <expr><s-tab> pumvisible()? "\<c-p>": "\<s-tab>"

