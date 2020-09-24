" vim-gitgutter
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_override_sign_column_highlight = 0

"let g:gitgutter_sign_added = '✚'
"let g:gitgutter_sign_modified = '✹'
"let g:gitgutter_sign_removed = '-'
"let g:gitgutter_sign_removed_first_line = '-'
"let g:gitgutter_sign_modified_removed = '-'

" fugitive

" <tab>g and <space>g to navigate git changes
nmap <silent> <tab>g [c
nmap <silent> <space>g ]c

