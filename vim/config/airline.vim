let g:airline_theme           = 'easycolors'
"let g:airline_theme           = 'gruvbox'
let g:airline_powerline_fonts = 1

"let g:airline_mode_map =
"\{
  "\ '__' : '-',
  "\ 'n'  : 'N',
  "\ 'i'  : 'I',
  "\ 'R'  : 'R',
  "\ 'c'  : 'C',
  "\ 'v'  : 'V',
  "\ 'V'  : 'VL',
  "\ '' : 'VB',
  "\ 's'  : 'S',
  "\ 'S'  : 'S',
  "\ '' : 'S',
"\}

let g:airline_mode_map = {
    \ '__'     : '',
    \ 'c'      : '',
    \ 'i'      : '',
    \ 'ic'     : '',
    \ 'ix'     : '',
    \ 'n'      : '',
    \ 'multi'  : '',
    \ 'ni'     : '',
    \ 'no'     : '',
    \ 'R'      : '',
    \ 'Rv'     : '',
    \ 's'      : '',
    \ 'S'      : '',
    \ ''     : '',
    \ 't'      : '',
    \ 'v'      : '',
    \ 'V'      : '',
    \ ''     : '',
    \ }


let g:airline_skip_empty_sections              = 1
"let g:airline_section_b                        = ''
let g:airline_section_c                        = '%#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_section_y                        = ''
"let g:airline_section_z                        = '%L Line(s) %{g:airline_symbols.linenr} Column %3v '
let g:airline_section_z                        = 'ln %l/%L %{g:airline_symbols.linenr}col %v '
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#wordcount#enabled     = 0
let g:airline#extensions#tagbar#enabled        = 0
let g:airline#extensions#whitespace#enabled    = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline_symbols = {'space': ' ', 'paste': 'PASTE', 'maxlinenr': ' ', 'dirty': '', 'crypt': '🔒',
                        \'linenr': '☰ ', 'readonly': '', 'spell': 'SPELL', 'modified': '*',
                        \'notexists': '', 'keymap': 'Keymap:', 'ellipsis': '•••', 'branch': '', 'whitespace': '☲'}


"function! s:AirlineInit()
  "let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
  "let g:airline_section_b = airline#section#create(['hunks','branch'])
  "let g:airline_section_c = airline#section#create(['%{getcwd()}'])

  "let g:airline_section_c = airline#section#create(['%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'])
  "let g:airline_section_c = airline#section#create_left(['file'])
  "let g:airline_section_y = ''
  "let g:airline_section_z = 'Column %-3v %{g:airline_symbols.linenr}%L Line(s)'
  "echo "airline init"
"endfunction

"autocmd User AirlineToggledOn call s:AirlineInit()

