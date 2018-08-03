let s:ctags = getcwd().'/ctags'

au BufWritePost * call system('[ -x "'.s:ctags.'" ] && '.s:ctags.' >/dev/null 2>&1 &')

