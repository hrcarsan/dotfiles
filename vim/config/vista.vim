nmap <leader>ot :Vista ctags<cr>
nmap <leader>oc :Vista coc<cr>

let g:vista_default_executive = 'ctags'

"let g:vista_executive_for = {
    "\ 'typescript': 'coc',
    "\ }

let g:vista_echo_cursor = 0
let g:vista_disable_statusline = 1
let g:airline#extensions#vista#enabled = 0
let g:vista_highlight_whole_line = 1
let g:vista_sidebar_position = 'call g:CustomOpenVista()'
let g:vista_sidebar_width = '| "'
let g:vista_stay_on_open = 0
let g:vista_blink = [0, 0]

let g:vista#renderer#icons = {
\    'functions': "\uf6a6",
\    'variables': "\ufab6",
\    'constant definitions': "\uf8ff",
\    'classes': "\uf0e8"
\  }

function! g:CustomOpenVista()

  let vistawinnr = bufwinnr('__vista__')

  if vistawinnr == -1
    vertical botright 35new __vista__
    return
  endif

  exe "normal ".vistawinnr."\<c-w>\<c-w>"
endfunction
