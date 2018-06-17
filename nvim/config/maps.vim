
  let mapleader = ","

  " save a file
  nnoremap <leader>w :w<cr>:<cr>

  " quit
  nnoremap <leader>q :qa<cr>

  " open vim configuration in a new window
  nnoremap <leader>ve :vsplit $MYVIMRC<cr>

  " source vim configuration
  nnoremap <leader>vs :source $MYVIMRC<cr>:noh<cr>h

  nnoremap <leader>d <c-]>

  " add \v (magic regex) to do normal regex searchs
  nnoremap / /\v
  vnoremap / /\v
  nnoremap ? ?\v
  vnoremap ? ?\v

  " remove search higlight
  nnoremap <leader><space> :noh<cr>

  " buffers: previous, next, close
  nnoremap <c-h> :silent bp<cr>
  nnoremap <c-l> :silent bn<cr>
  nnoremap <c-x> :bd<cr>

  " move lines down/up
  nnoremap - :m .+1<cr>==
  nnoremap _ :m .-2<cr>==

  " enclosed width quotes
  nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
  nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

  " return to normal mode
  inoremap <c-c> <esc>
  nnoremap <c-c> :<c-c>
  
  " cut/copy/paste
  vnor <C-X> "+x
  vnor <C-Y> "+y
  inor <C-V> <C-O>:set paste<CR><C-R>+<C-O>:set nopaste<CR>
  vnor <C-V> :<C-U>set paste<CR>gvc<C-R>+<C-O>:set nopaste<CR><ESC>

  " save workspace
  "nnoremap <leader>tw :ToggleWorkspace<CR>

  nnoremap <leader>n *N
  nnoremap <leader>c :GitGutterToggle<cr>
  nnoremap <leader>z Vi{zfkj

  nnoremap <leader>i :IndentLinesToggle<cr>
  
  " Show hi group under cursor
  map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

