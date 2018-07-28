"                       TAGBAR
" SET-UP --------------------------------------------
let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions:0:0',
        \ 'f:functions',
        \ 'j:javascript functions',
    \ ],
\ }

function! Open_typescript()
  let g:tagbar_type_typescript = {
    \ 'ctagsbin' : 'tstags',
    \ 'ctagsargs' : '-f-',
    \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'c:const:0:1',
    \ ],
    \ 'sort' : 0
  \}
endfunction

autocmd FileType typescript call Open_typescript()

" MAPS ------------------------------------------------
nnoremap <leader>r :TagbarOpen<CR><c-w>b

