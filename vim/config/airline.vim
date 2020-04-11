let g:airline_theme           = 'easycolors'
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

let g:airline_skip_empty_sections              = 1
"let g:airline_section_b                        = ''
let g:airline_section_c                        = '%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_section_y                        = ''
let g:airline_section_z                        = '%L Line(s) %{g:airline_symbols.linenr} Column %3v '
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#wordcount#enabled     = 0
let g:airline#extensions#tagbar#enabled        = 0
let g:airline#extensions#whitespace#enabled    = 0

"function! AirlineInit()
  "let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
  "let g:airline_section_b = airline#section#create(['hunks','branch'])
  "let g:airline_section_c = airline#section#create(['%{getcwd()}'])

  "let g:airline_section_c = airline#section#create(['%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'])
  "let g:airline_section_c = airline#section#create_left(['file'])
  "let g:airline_section_y = ''
  "let g:airline_section_z = 'Column %-3v %{g:airline_symbols.linenr}%L Line(s)'
"endfunction

"autocmd User AirlineAfterInit call AirlineInit()

