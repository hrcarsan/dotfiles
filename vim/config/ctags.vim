let g:ctags_exe = getcwd().'/ctags'

"au BufWritePost * call system('[ -x "'.s:ctags_exe.'" ] && '.s:ctags_exe.' >/dev/null 2>&1 &')
nnoremap <leader>gt :call system('[ -x "'.g:ctags_exe.'" ] && '.g:ctags_exe.' >/dev/null 2>&1 &') \| echo 'Updating tags in background...'<cr>
