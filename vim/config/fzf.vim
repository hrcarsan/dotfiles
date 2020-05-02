let $FZF_DEFAULT_COMMAND = 'rg --files --smart-case'

"let g:fzf_layout = { 'down': '10' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"noremap <c-k> :Buffers<cr>
"noremap <c-j> :History<cr>
"noremap <c-j> :Files<cr>

"noremap <leader>t :BTags<cr>
noremap <leader>T :Tags<cr>

nnoremap <leader>d :call fzf#vim#tags("'".expand('<cword>'))<cr>

"command! -bang -nargs=? -complete=dir Files
    "\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

autocmd FileType fzf call s:fzf_settings()

function! s:fzf_settings() abort
  "inoremap <c-o> <esc>:
  "inoremap <c-c> <esc>
  tnoremap <c-c> <esc>
endfunction
