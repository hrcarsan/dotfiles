noremap <c-k> :Buffers<cr>
noremap <c-j> :History<cr>
noremap <c-p> :Files<cr>

noremap <leader>t :BTags<cr>
noremap <leader>T :Tags<cr>

nnoremap <leader>d :call fzf#vim#tags("'".expand('<cword>'))<cr>
