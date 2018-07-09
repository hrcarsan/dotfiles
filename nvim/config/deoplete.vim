"set completeopt-=preview
let g:deoplete#enable_at_startup = 1

" move down/up in complete panel with tab and shitf + tab
inoremap <expr><tab>   pumvisible()? "\<c-n>": "\<tab>"
inoremap <expr><s-tab> pumvisible()? "\<c-p>": "\<s-tab>"

"augroup ale
  "au!
  "autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"augroup END
