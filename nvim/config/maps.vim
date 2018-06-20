let mapleader = ","

" open vim configuration in a new window
nnoremap <leader>ve :vsplit $MYVIMRC<cr>

" source vim configuration
nnoremap <leader>vs :source $MYVIMRC<cr>:noh<cr>h

" save a file
nnoremap <leader>w :w<cr>:<cr>

" quit
nnoremap <leader>q :qa<cr>

" <c-]> is the default vim map go to definition
"nnoremap <leader>d <c-]>
nnoremap gd <c-]>

" add \v (magic regex) to do normal regex searchs
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" remove search higlight
nnoremap <leader><space> :noh<cr>

" buffers: previous, next, close
nnoremap <c-h> :bp<cr>:<c-c>
nnoremap <c-l> :bn<cr>:<c-c>
nnoremap <c-x> :bd<cr>:<c-c>

nnoremap Y y$

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

" Show hi group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
          \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
          \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:RunShellCommand(cmdline)
  "echo a:cmdline
  let expanded_cmdline = a:cmdline

  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  normal ggdd
  setlocal nomodifiable
  "1
endfunction
